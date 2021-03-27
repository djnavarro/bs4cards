


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
#' @param width Bootstrap classes setting card width
#' @param padding Bootstrap classes setting card padding
#' @param margin Bootstrap classes setting card margin
#' @param footer Card footer
#' @param header Card header
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card <- function(title, text, image,
                 image_align = "top",
                 width = bs_col(medium = 4),
                 margin = bs_mar(base = 0),
                 padding = bs_pad(base = 2),
                 footer = NULL,
                 header = NULL) {

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
    htmltools::div(class = paste(width, margin, padding, "d-flex"))
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


