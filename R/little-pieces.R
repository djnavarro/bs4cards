
make_pieces <- function(title, text, image, link, footer, header,
                        layout, border, corners) {

  title  <- make_title(title, text)
  text   <- make_text(text, title)

  image  <- make_image(image, layout, corners, border)
  footer <- make_footer(footer, corners, border)

  if(!is.null(link)) {
    title <- htmltools::a(title, href = link)
    image <- htmltools::a(image, href = link)
  }

  return(list(title = title, text = text, image = image, footer = footer))
}


# wrapper functions for small html pieces ---------------------------------

make_title <- function(title, text) {
  if(!is.null(title)) {
    htmltools::h5(
      title,
      class = title_class(!is.null(text))
    )
  }
}

make_text <- function(text, title) {
  if(!is.null(text)) {
    htmltools::p(
      text,
      class = text_class(!is.null(title))
    )
  }
}

make_image <- function(image, layout, corners, border) {
  if(!is.null(image)) {
    htmltools::img(
      src = image,
      class = image_class(layout),
      style = image_style(corners, border, layout)
    )
  }
}

make_footer <- function(footer, corners, border) {
  if(!is.null(footer)) {
    htmltools::div(
      footer,
      class = footer_class(),
      style = footer_style(corners, border)
    )
  }
}

