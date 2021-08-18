
make_pieces <- function(title, text, image, link, footer, header,
                        layout, border, corners) {

  title  <- make_title(title)
  text   <- make_text(text)

  image  <- make_image(image, layout, corners, border)
  footer <- make_footer(footer, corners, border)

  if(!is.null(link)) {
    title <- htmltools::a(title, href = link)
    image <- htmltools::a(image, href = link)
  }

  return(list(title = title, text = text, image = image, footer = footer))
}


# wrapper functions for small html pieces ---------------------------------

make_title <- function(title) {
  if(!is.null(title)) {
    htmltools::h5(
      title,
      class = "card-title px-3",
      style = "margin-top:1rem; margin-bottom:1rem"
    )
  }
}

make_text <- function(text) {
  if(!is.null(text)) {
    htmltools::p(
      text,
      class = "card-text px-3 pb-3"
    )
  }
}

make_image <- function(image, layout, corners, border) {
  if(!is.null(image)) {
    htmltools::img(
      src = image,
      class = image_classes(layout),
      style = image_style(corners, border)
    )
  }
}

make_footer <- function(footer, corners, border) {
  if(!is.null(footer)) {
    htmltools::div(
      footer,
      class = footer_classes(),
      style = footer_style(corners, border)
    )
  }
}

