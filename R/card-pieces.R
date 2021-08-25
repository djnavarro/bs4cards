
card_pieces <- function(title, text, image, link, footer, header,
                        layout, border, corners) {

  title  <- make_title(title, text)
  text   <- make_text(text, title)

  image  <- make_image(image, layout, corners, border)
  footer <- make_footer(footer, corners, border)
  header <- make_header(header, corners, border)

  if(!is_na(link)) {
    title <- htmltools::a(title, href = link)
    image <- htmltools::a(image, href = link)
  }

  return(list(title = title, text = text, image = image,
              footer = footer, header = header))
}


# wrapper functions for small html pieces ---------------------------------

make_title <- function(title, text) {
  if(is_na(title)) return(NULL)

  return(htmltools::h5(
    title,
    class = title_class(!is_na(text))
  ))
}

make_text <- function(text, title) {
  if(is_na(text)) return(NULL)

  return(htmltools::p(
    text,
    class = text_class(!is_na(title))
  ))
}

make_image <- function(image, layout, corners, border) {
  if(is_na(image)) return(NULL)

  return(htmltools::img(
    src = image,
    class = image_class(layout),
    style = image_style(corners, border, layout)
  ))
}

make_footer <- function(footer, corners, border) {
  if(is_na(footer)) return(NULL)

  return(htmltools::div(
    footer,
    class = footer_class(),
    style = footer_style(corners, border)
  ))
}

make_header <- function(header, corners, border) {
  if(is_na(header)) return(NULL)

  return(htmltools::div(
    header,
    class = header_class(),
    style = header_style(corners, border)
  ))
}

