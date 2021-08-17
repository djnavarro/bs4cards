#' Specifies a bootstrap card
#'
#' @param data Data
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param link URL to link to from title and image
#' @param footer Card footer
#' @param header Card header
#' @param width Card width ("narrow", "medium", "wide")
#' @param layout Card layout ("label-above", "label-below", "label-left", "label-right", "inset-top", "inset-bottom")
#' @param padding Spacing between parts of the card (integer between 0 and 5)
#' @param margin Spacing between adjacent cards (integer between 0 and 5)
#' @param colour Colour applied to the card (interpretation depends on layout)
#'
#' @return A "shiny.tag" object
#' @export
#'
cards <- function(data, title = NULL, text = NULL, image = NULL, link = NULL,
                  footer = NULL, header = NULL, width = "medium",
                  layout = "label-below", padding = 0, margin = 1,
                  colour = "#ffffffaa") {

  card_list <-data %>%
    dplyr::transmute(
      title  = {{title}},
      text   = {{text}},
      image  = {{image}},
      link   = {{link}},
      header = {{header}},
      footer = {{footer}},
      width  = {{width}},
      layout = {{layout}},
      padding = {{padding}},
      margin = {{margin}},
      colour = {{colour}}
    ) %>%
    purrr::transpose() %>%
    purrr::map(purrr::lift_dl(make_card))

  collate <- function(...) {
    htmltools::div(
      class = paste("row p-0 m-0 d-flex"),
      ...
    )
  }

  do.call(collate, card_list)
}



# arrange the pieces into a card ------------------------------------------

make_card <- function(title = NULL, text = NULL, image = NULL, link = NULL,
                      footer = NULL, header = NULL, width, layout,
                      padding, margin, colour) {

  title  <- make_title(title)
  text   <- make_text(text)
  image  <- make_image(image)
  header <- make_header(header)
  footer <- make_footer(footer)

  if(!is.null(link)) {
    title <- htmltools::a(title, href = link)
    image <- htmltools::a(image, href = link)
  }

  bits <- assemble_bits(header, image, title, text, footer, layout, colour)
  card <- assemble_card(bits, width, padding, margin, colour)
  return(card)
}




# assembly for the card structure -----------------------------------------

assemble_bits <- function(header, image, title, text, footer, layout, colour) {

  if(layout == "label-below") {
    body <- htmltools::div(class = "card-body", title, text, style = "background-color: #00000000;")
    return(htmltools::div(header, image, body, footer))
  }

  if(layout == "label-above") {
    body <- htmltools::div(class = "card-body", title, text, style = "background-color: #00000000;")
    return(htmltools::div(header, body, image, footer))
  }

  if(layout == "label-right") {
    body <- htmltools::div(class = "card-body", title, text)
    lhs <- htmltools::div(class = "col-sm-6", image)
    rhs <- htmltools::div(class = "col-sm-6", body, style = "background-color: #00000000;")
    row <- htmltools::div(class = "row no-gutters", lhs, rhs)
    return(htmltools::div(header, row, footer))
  }

  if(layout == "label-left") {
    body <- htmltools::div(class = "card-body", title, text)
    lhs <- htmltools::div(class = "col-sm-6", body, style = "background-color: #00000000;")
    rhs <- htmltools::div(class = "col-sm-6", image)
    row <- htmltools::div(class = "row no-gutters", lhs, rhs)
    return(htmltools::div(header, row, footer))
  }

  if(layout == "inset-bottom") {
    css <- paste(
      "height: 20%;",
      "position: absolute;",
      "top: 80%;",
      paste0("background-color: ", colour, ";")
    )
    body <- htmltools::div(
      class = "card-img-overlay",
      style = css,
      title, text
    )
    return(htmltools::div(header, image, body, footer))
  }

  if(layout == "inset-top") {
    css <- paste(
      "height: 20%;",
      "position: absolute;",
      "top: 0%;",
      paste0("background-color: ", colour, ";")
    )
    body <- htmltools::div(
      class = "card-img-overlay",
      style = css,
      title, text
    )
    return(htmltools::div(header, image, body, footer))
  }
}


assemble_card <- function(pieces, width, padding, margin, colour) {

  colour_css <- paste0("background-color: ", colour , ";")

  inner_card <- htmltools::div(
    class = paste0("card d-flex m-0 p-", padding, " col-12"),
    style = paste0("visibility: visible; ", colour_css),
    pieces
  )

  outer_card <- htmltools::div(
    class = paste0("card d-flex m-0 p-", margin, " ", make_width(width)),
    style = "visibility: hidden;",
    inner_card
  )

  return(outer_card)
}







# wrapper functions for small html pieces ---------------------------------

make_title <- function(title) {
  if(!is.null(title)) {
    htmltools::h5(
      title,
      class = "card-title",
      style = "margin-top:1rem; margin-bottom:1rem"
    )
  }
}

make_text <- function(text) {
  if(!is.null(text)) htmltools::p(text, class = "card-text")
}

make_image <- function(image, image_position) {
  if(!is.null(image)) htmltools::img(src = image, class = "card-img")
}

make_header <- function(header) {
  if(!is.null(header)) htmltools::div(header, class = "card-header")
}

make_footer <- function(footer) {
  if(!is.null(footer)) htmltools::div(footer, class = "card-footer text-muted")
}

make_width <- function(width) {
  if(width == "narrow") return("col-6 col-sm-4 col-md-3 col-lg-2 col-xl-2")
  if(width == "medium") return("col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3")
  if(width == "wide") return("col-12 col-sm-12 col-md-6 col-lg-6 col-xl-4")
  if(width == "very-wide") return("col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6")
  return(width)
}






