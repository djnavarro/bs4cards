

card_body <- function(title, text) {

  # construct tags for each body part
  title_tag <- card_title(title)
  text_tag <- card_text(text)

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
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card <- function(title, image, text) {

  body_tag <- card_body(title, text)
  image_tag <- card_img(image)

  htmltools::div(
    list(image_tag, body_tag),
    class = "card"
  )
}
