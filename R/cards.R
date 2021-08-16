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
#' @param orientation defailt top
#'
#' @return A "shiny.tag" object
#' @export
#'
cards <- function(data, title = NULL, text = NULL, image = NULL, link = NULL,
                  footer = NULL, header = NULL, width = "medium", orientation = "top") {

  card_list <-data %>%
    dplyr::transmute(
      title  = {{title}},
      text   = {{text}},
      image  = {{image}},
      link   = {{link}},
      header = {{header}},
      footer = {{footer}},
      width  = {{width}},
      orientation = {{orientation}}
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
                      footer = NULL, header = NULL, width, orientation = "top") {

  title  <- make_title(title)
  text   <- make_text(text)
  image  <- make_image(image)
  header <- make_header(header)
  footer <- make_footer(footer)

  if(!is.null(link)) {
    title <- htmltools::a(title, href = link)
    image <- htmltools::a(image, href = link)
  }

  body <- make_body(title, text)

  style <- paste("card", make_width(width), "p-0 m-0 d-flex")
  arrange_card(header, image, body, footer, orientation, style)
}



# wrapper functions for small html pieces ---------------------------------

make_title <- function(title) {
  if(!is.null(title)) htmltools::h5(title, class = "card-title")
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
  if(!is.null(footer)) htmltools::div(footer, class = "card-footer")
}

make_body <- function(title, text) {
  htmltools::div(class = "card-body", title, text)
}


make_width <- function(width) {
  if(width == "narrow") return("col-6 col-sm-4 col-md-3 col-lg-2 col-xl-2")
  if(width == "medium") return("col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3")
  if(width == "wide") return("col-12 col-sm-12 col-md-6 col-lg-6 col-xl-4")
  return(width)
}

arrange_card <- function(header, image, body, footer, orientation, style) {

  if(orientation == "top") {
    return(htmltools::div(class = style, header, image, body, footer))
  }

  if(orientation == "bottom") {
    return(htmltools::div(class = style, header, body, image, footer))
  }

}



