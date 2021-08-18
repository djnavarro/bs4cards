#' Specifies a bootstrap card
#'
#' @param data Data
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param link URL to link to from title and image
#' @param footer Card footer
#' @param width Card width ("narrow", "medium", "wide")
#' @param layout Card layout ("label-above", "label-below", "label-left", "label-right", "inset-top", "inset-bottom")
#' @param padding Spacing between parts of the card (integer between 0 and 5)
#' @param gutter Spacing between adjacent cards (integer between 0 and 5)
#' @param breakpoint Position to insert breaks for horizontal or inset cards, interpreted as proportion of card allocated to label
#' @param colour Colour applied to the card (interpretation depends on layout)
#'
#' @return A "shiny.tag" object
#' @export
#'
cards <- function(data, title = NULL, text = NULL, image = NULL, link = NULL,
                  footer = NULL, width = "medium",
                  layout = "label-below", padding = 0, gutter = 1,
                  breakpoint = NULL, colour = "#ffffffaa") {

  card_list <-data %>%
    dplyr::transmute(
      title  = {{title}},
      text   = {{text}},
      image  = {{image}},
      link   = {{link}},
      footer = {{footer}},
      layout = {{layout}},
      padding = {{padding}},
      gutter = {{gutter}},
      breakpoint = {{breakpoint}},
      colour = {{colour}}
    ) %>%
    purrr::transpose() %>%
    purrr::map(purrr::lift_dl(make_card))

  collate <- function(...) {
    row_margins <- paste(
      "my-1",
      ifelse(gutter == 0, "mx-0", paste0("mx-n", gutter))
    )
    htmltools::div(
      class = paste("row p-0", make_row_cols(width), row_margins), #, " d-flex"),
      ...
    )
  }

  do.call(collate, card_list)
}



# arrange the pieces into a card ------------------------------------------

make_card <- function(title = NULL, text = NULL, image = NULL, link = NULL,
                      footer = NULL, header = NULL, layout,
                      padding, gutter, breakpoint = NULL, colour) {

  title  <- make_title(title)
  text   <- make_text(text)
  image  <- make_image(image, layout)
  footer <- make_footer(footer)

  if(!is.null(link)) {
    title <- htmltools::a(title, href = link)
    image <- htmltools::a(image, href = link)
  }

  if(layout == "label-below" | layout == "label-above") {
    card <- make_card_vertical(image, title, text, footer, layout, padding, gutter, colour)
    return(card)
  }

  if(layout == "label-right" | layout == "label-left") {
    card <- make_card_horizontal(image, title, text, footer, layout, padding, gutter, breakpoint, colour)
    return(card)
  }

  if(layout == "inset-bottom" | layout == "inset-top") {
    card <- make_card_inset(image, title, text, footer, layout, padding, gutter, breakpoint, colour)
    return(card)
  }
}


# card builders for different layout types --------------------------------


make_card_vertical <- function(image, title, text, footer, layout, padding, gutter, colour) {

  body <- htmltools::div(
    class = paste0("card-body justify-content-end border rounded m-0 p-", padding),
    style = paste0("visibility: visible; background-color: ", colour),
    title, text
  )

  card_class <- paste0("card bg-transparent border-0 m-0 p-", gutter)

  if(layout == "label-below") {
    card <- htmltools::div(
      class = card_class,
      image, body, footer
    )
  }

  if(layout == "label-above") {
    card <- htmltools::div(
      class = card_class,
      body, image, footer
    )
  }

  return(card)

}


make_card_horizontal <- function(image, title, text, footer, layout, padding, gutter, breakpoint, colour) {

  if(is.null(breakpoint)) breakpoint <- 2/3

  label_cols <- round(breakpoint * 12)
  image_cols <- 12 - label_cols

  label_class <- paste0("col-sm-", label_cols)
  image_class <- paste0("col-sm-", image_cols)

  if(layout == "label-right") {
    lhs <- htmltools::div(class = image_class, image)
    rhs <- htmltools::div(class = label_class, title, text, style = "background-color: #00000000;")
    row <- htmltools::div(class = "row no-gutters", lhs, rhs)
    core <- htmltools::div(row)
  }

  if(layout == "label-left") {
    lhs <- htmltools::div(class = label_class, title, text, style = "background-color: #00000000;")
    rhs <- htmltools::div(class = image_class, image)
    row <- htmltools::div(class = "row no-gutters", lhs, rhs)
    core <- htmltools::div(row)
  }

  inner <- htmltools::div(
    class = paste0("card-body border rounded m-0 p-", padding, " col-12"),
    style = paste0("visibility: visible; background-color: ", colour),
    core
  )

  card <- htmltools::div(
    class = paste0("card bg-transparent border-0 m-0 p-", gutter),
    inner, footer
  )

  return(card)
}



make_card_inset <- function(image, title, text, footer, layout, padding, gutter, breakpoint, colour) {

  if(layout == "inset-top") top <- "0%"
  if(layout == "inset-bottom") top <- "80%"

  overlay <- htmltools::div(
    class = "card-img-overlay p-0 m-0",
    style = paste0(
      "background-color: ", colour, ";",
      "height: 20%;",
      "position: absolute;",
      "top: ", top, ";"
    ),
    title, text
  )

  inner <- htmltools::div(
    style = "position: relative",
    image, overlay
  )

  card <- htmltools::div(
    class = paste0("card bg-transparent border-0 m-0 p-", gutter),
    inner, footer
  )

  return(card)
}

# wrapper functions for small html pieces ---------------------------------

make_title <- function(title) {
  if(!is.null(title)) {
    htmltools::h5(
      title,
      class = "card-title px-3",
      style = "margin-top:1rem; margin-bottom:1rem"
    )
  }
}

make_text <- function(text) {
  if(!is.null(text)) htmltools::p(text, class = "card-text px-3 pb-3")
}

make_image <- function(image, layout) {
  if(is.null(image)) return(NULL)
  if(layout == "label-above") return(htmltools::img(src = image, class = "card-img-bottom"))
  if(layout == "label-below") return(htmltools::img(src = image, class = "card-img-top"))
  return(htmltools::img(src = image, class = "card-img"))
}

make_footer <- function(footer) {
  if(!is.null(footer)) {
    htmltools::div(footer, class = "card-footer small text-muted h-auto px-3 py-auto border-0") #bg-transparent")
  }
}

make_width <- function(width) {
  if(width == "narrow") return("col-6 col-sm-4 col-md-3 col-lg-2 col-xl-2")
  if(width == "medium") return("col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3")
  if(width == "wide") return("col-12 col-sm-12 col-md-6 col-lg-6 col-xl-4")
  if(width == "very-wide") return("col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6")
  return(width)
}

make_row_cols <- function(width){
  if(width == "narrow") return("row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6")
  if(width == "medium") return("row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4")
  if(width == "wide") return("row-cols-1 row-cols-md-2 row-cols-lg-3")
  if(width == "very-wide") return("row-cols-1 row-cols-lg-2")
  return(width)
}




