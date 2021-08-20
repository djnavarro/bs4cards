

make_card_vertical <- function(title, text, image, link,
                               footer, header, tags, layout,
                               padding, gutter, breakpoint,
                               colour, border, radius) {

  corners <- tidy_corners(layout, footer, header, radius)
  pieces <- make_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  body_vertical <- htmltools::div(
    class = body_vertical_class(padding),
    style = body_vertical_style(colour, corners, border),
    pieces$title, pieces$text
  )

  if(layout == "label-below") {
    return(htmltools::div(
      class = card_class(gutter),
      style = card_style(corners),
      pieces$image, body_vertical, pieces$footer
    ))
  }

  if(layout == "label-above") {
    return(htmltools::div(
      class = card_class(gutter, tags),
      style = card_style(corners),
      body_vertical, pieces$image, pieces$footer
    ))
  }
}


make_card_horizontal <- function(title, text, image, link,
                                 footer, header, tags, layout,
                                 padding, gutter, breakpoint,
                                 colour, border, radius) {

  corners <- tidy_corners(layout, footer, header, radius)
  pieces <- make_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  # the default for horizontal cards is a wide label, presuming the common
  # use case for horizontal cards is for people to supply a descriptive blurb
  if(is.null(breakpoint)) breakpoint <- 2/3

  image_horizontal <- htmltools::div(
    class = image_horizontal_class(breakpoint),
    style = image_horizontal_style(corners),
    pieces$image
  )

  label_horizontal <- htmltools::div(
    class = label_horizontal_class(breakpoint),
    style = label_horizontal_style(colour = "#00000000", corners, border, layout),
    pieces$title, pieces$text
  )

  if(layout == "label-right") {lhs <- image_horizontal; rhs <- label_horizontal}
  if(layout == "label-left" ) {lhs <- label_horizontal; rhs <- image_horizontal}

  row_horizontal <- htmltools::div(
    class = "row no-gutters",
    style = corners[["core"]],
    lhs, rhs
  )

  body_horizontal <- htmltools::div(
    class = paste0("card-body border-0 m-0 p-", padding, " col-12"),
    style = paste0(
      "visibility: visible; ",
      "background-color: ", colour,
      corners[["core"]]
    ),
    row_horizontal
  )

  return(htmltools::div(
    class = card_class(gutter, tags),
    style = card_style(corners),
    body_horizontal, pieces$footer
  ))
}



make_card_inset <- function(title, text, image, link,
                            footer, header, tags, layout,
                            padding, gutter, breakpoint,
                            colour, border, radius) {

  corners <- tidy_corners(layout, footer, header, radius)
  pieces <- make_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  # the default breakpoint for inset cards is thin, as it is presumed the
  # typical use case for inset cards is to provide a small floating caption/title
  if(is.null(breakpoint)) breakpoint <- 1/6

  label_inset <- htmltools::div(
    class = label_inset_class(),
    style = label_inset_style(colour, corners, border, breakpoint, layout),
    pieces$title, pieces$text
  )

  body_inset <- htmltools::div(
    style = body_inset_style(corners),
    pieces$image, label_inset
  )

  return(htmltools::div(
    class = card_class(gutter, tags),
    style = card_style(corners),
    body_inset, pieces$footer
  ))
}



