

#' Specifies a bootstrap card
#'
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param link URL to link to from title and image
#' @param image_align Placement of the card image ("top" or "bottom")
#' @param width Width of the card ("thin", "medium" or "wide")
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
                 width = "medium",
                 margin = bs_mar(base = 0),
                 padding = bs_pad(base = 2),
                 footer = NULL,
                 header = NULL) {

  body_tag <- card_body(title, text, link = link)
  image_tag <- as_card_part(image, "image", align = image_align, link = link)
  footer_tag <-as_card_part(footer, "footer")
  header_tag <-as_card_part(header, "header")

  if(width == "thin")   width <- bs_col(base = 6, small = 4, medium = 3, large = 2, extra_large = 2)
  if(width == "medium") width <- bs_col(base =12, small = 6, medium = 4, large = 3, extra_large = 3)
  if(width == "wide")   width <- bs_col(base = 12, small = 12, medium = 6, large = 6, extra_large = 4)

  if(image_align == "top") card_content <- list(header_tag, image_tag, body_tag, footer_tag)
  if(image_align == "bottom") card_content <- list(header_tag, body_tag, image_tag, footer_tag)


  class(card_content) <- "bs4card"

  return(card_content)
  card_content %>%
    htmltools::div(class = paste("card", width, margin, padding, "d-flex"))
}



#' Create a grid of cards
#'
#' @param cards List of cards
#' @param padding Bootstrap classes setting card group padding
#' @param margin Bootstrap classes setting card group margin
#'
#' @return A thing
#' @export
#'
#' @examples
card_grid <- function(cards, margin = bs_mar(top = 3, bottom = 3), padding = bs_pad()) {

  cards %>%
    htmltools::div(class = paste("row", margin, padding))
}

