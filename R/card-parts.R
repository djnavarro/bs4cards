
#' Specify the image for a card
#'
#' @param src Path to the image file
#' @param link URL to visit when image is clicked (optional)
#' @param alt Alt text for the image
#' @param align Alignment of the image within the card ("top", "left" or "right")
#' @param padding Padding size for the image (integer between 0 and 5)
#' @param margin Margin size for the image (integer between 0 and 5)
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_img <- function(src, link = NULL, alt = NULL, align = "top", padding = 0, margin = 0) {

  # construct class string for the image
  class_img <- paste0("card-img-", align)
  class_pad <- paste0("p-", padding)
  class_mar <- paste0("m-", margin)
  class_tot <-

  # construct image tag
  img_tag <- htmltools::img(
    class = paste(class_img, class_pad, class_mar),
    src = src,
    alt = alt
  )

  # wrap image tag in link if requested
  if(!is.null(link)) {
    img_tag <- img_tag %>% htmltools::a(href = link)
  }

  return(img_tag)
}

#' Specify the title of a card
#'
#' @param title String specifying the title
#' @param level Level of header (integer between 1 and 6, default = 5)
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_title <- function(title, level = 5) {
  h_fun <- eval(str2lang(paste0("htmltools::h", level)))
  return(h_fun(title, class = "card-title"))
}

#' Specify the subtitle of a card
#'
#' @param subtitle String specifying the subtitle
#' @param level Level of header (integer between 1 and 6, default = 6)
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_subtitle <- function(subtitle, level = 6) {
  h_fun <- eval(str2lang(paste0("htmltools::h", level)))
  return(h_fun(title, class = "card-subtitle"))
}

#' Specify the text of a card
#'
#' @param title String specifying the text to insert in a card
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_text <- function(text) {
  htmltools::p(text, class = "card-text")
}


