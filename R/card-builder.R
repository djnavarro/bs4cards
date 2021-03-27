


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
#' @param image Path to the card image
#' @param text Text for the card
#' @param width Width for the card (25, 50, 75 or 100, default = 25)
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card <- function(title, image, text, width = 25) {

  body_tag <- card_body(title, text)
  image_tag <- as_card_part(image, "image")

  htmltools::div(
    list(image_tag, body_tag),
    class = paste0("card w-", width)
  )
}



