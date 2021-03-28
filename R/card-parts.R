
#' Specify the image for a card
#'
#' @param image Path to the image file
#' @param link URL to visit when image is clicked (optional)
#' @param alt Alt text for the image
#' @param align Alignment of the image within the card ("top", "bottom" or NULL)
#' @param pad Padding size for the image (integer between 0 and 5)
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_image <- function(image, link = NULL, alt = NULL, align = NULL, pad = 0) {

  # construct class string for the image
  class_img <- ifelse(
    test = is.null(align),
    yes = "card-img",
    no = paste0("card-img-", align)
  )
  class_pad <- paste0("p-", pad)

  # construct image tag
  img_tag <- htmltools::img(
    class = paste(class_img, class_pad),
    src = image,
    alt = alt
  )

  # wrap image tag in link if requested
  if(!is.null(link)) {
    img_tag <- img_tag %>% htmltools::a(href = link)
  }

  # add S3 class
  img_tag <- img_tag %>%
    add_s3_class("bs4card.image")

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
card_title <- function(title, level = 5, link = NULL) {
  h_fun <- eval(str2lang(paste0("htmltools::h", level)))

  title_tag <- title %>%
    h_fun(class = "card-title") %>%
    add_s3_class("bs4card.title")

  # wrap title tag in link if requested
  if(!is.null(link)) {
    title_tag <- title_tag %>% htmltools::a(href = link)
  }

  return(title_tag)
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

  subtitle_tag <- subtitle %>%
    h_fun(class = "card-subtitle") %>%
    add_s3_class("bs4card.subtitle")

  return(subtitle_tag)
}


#' Specify the text of a card
#'
#' @param text String specifying the text to insert in a card
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_text <- function(text) {

  text_tag <- text %>%
    htmltools::p(class = "card-text") %>%
    add_s3_class("bs4card.text")

  return(text_tag)
}


#' Specify the footer of a card
#'
#' @param text String specifying footer content
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_footer <- function(text) {
  text %>%
    htmltools::div(class = "card-footer") %>%
    add_s3_class("bs4card.footer")
}


#' Specify the header of a card
#'
#' @param text String specifying header content
#'
#' @return A "shiny.tag" object
#' @export
#'
#' @examples
card_header <- function(text) {
  text %>%
    htmltools::div(class = "card-header") %>%
    add_s3_class("bs4card.header")
}



card_body <- function(title, text, link = NULL) {

  title_tag <- as_card_part(title, "title", link = link)
  text_tag <- as_card_part(text, "text")

  htmltools::div(
    list(title_tag, text_tag),
    class = "card-body"
  )
}




