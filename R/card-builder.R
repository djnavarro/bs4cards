


card_body <- function(title, text) {

  title_tag <- as_card_part(title, "title")
  text_tag <- as_card_part(text, "text")

  htmltools::div(
    list(title_tag, text_tag),
    class = "card-body"
  )
}


#' Specifies a bootstrap card
#'
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param image_align Placement of the card image ("top" or "bottom")
#' @param col_spec Bootstrap classes setting card width
#' @param footer Card footer
#' @param header Card header
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card <- function(title, text, image, image_align = "top", col_spec = "col-12 col-md-4", footer = NULL, header = NULL) {

  body_tag <- card_body(title, text)
  image_tag <- as_card_part(image, "image", align = image_align)

  if(is.null(footer)) {
    footer_tag <- NULL
  } else {
    footer_tag <- as_card_part(footer, "footer")
  }

  if(is.null(header)) {
    header_tag <- NULL
  } else {
    header_tag <- as_card_part(header, "header")
  }


  if(image_align == "top") {card_content <- list(header_tag, image_tag, body_tag, footer_tag)}
  if(image_align == "bottom") {card_content <- list(header_tag, body_tag, image_tag, footer_tag)}

  card_content %>%
    htmltools::div(class = "card") %>%
    htmltools::div(class = paste(col_spec, "mt-3 mb-3 d-flex align-items-stretch"))
}



#' Create a deck of cards
#'
#' @param cards List of cards
#'
#' @return sdfgdfg
#' @export
#'
#' @examples
card_group <- function(cards) {
  cards %>%
    htmltools::div(class = "card-group") %>%
    htmltools::div(class = "row") %>%
    htmltools::div(class = "container")
}


