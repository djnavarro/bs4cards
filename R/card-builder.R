


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
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card <- function(title, text, image, image_align = "top", col_spec = "col-12 col-md-4") {

  body_tag <- card_body(title, text)
  image_tag <- as_card_part(image, "image", align = image_align)

  if(image_align == "top") {card_content <- list(image_tag, body_tag)}
  if(image_align == "bottom") {card_content <- list(body_tag, image_tag)}

  card_content %>%
    htmltools::div(class = "card") %>%
    htmltools::div(class = paste(col_spec, "mt-3 mb-3 d-flex align-items-stretch"))

}



