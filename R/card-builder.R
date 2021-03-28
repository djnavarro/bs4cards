

#' Specifies a bootstrap card
#'
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param link URL to link to from title and image
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
card <- function(title = NULL,
                 text = NULL,
                 image = NULL,
                 link = NULL,
                 image_align = "top",
                 width = bs_col(medium = 4),
                 margin = bs_mar(base = 0),
                 padding = bs_pad(base = 2),
                 footer = NULL,
                 header = NULL) {

  body_tag <- card_body(title, text, link = link)
  image_tag <- as_card_part(image, "image", align = image_align, link = link)
  footer_tag <-as_card_part(footer, "footer")
  header_tag <-as_card_part(header, "header")

  if(image_align == "top") {card_content <- list(header_tag, image_tag, body_tag, footer_tag)}
  if(image_align == "bottom") {card_content <- list(header_tag, body_tag, image_tag, footer_tag)}

  card_content %>%
    htmltools::div(class = "card") %>%
    htmltools::div(class = paste(width, margin, padding, "d-flex"))
}



#' Create a group of cards
#'
#' @param cards List of cards
#' @param padding Bootstrap classes setting card group padding
#' @param margin Bootstrap classes setting card group margin
#'
#' @return A thing
#' @export
#'
#' @examples
card_group <- function(cards, margin = bs_mar(top = 2, bottom = 2), padding = bs_pad()) {

  cards %>%
    htmltools::div(class = paste("card-group", margin, padding)) %>%
    htmltools::div(class = "row") %>%
    htmltools::div(class = "container")
}

