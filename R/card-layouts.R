

layout_card_vertical <- function(title, text, image, link,
                                 footer, header, tags, layout,
                                 padding, gutter, breakpoint,
                                 colour, border, radius) {

  corners <- card_corners(layout, footer, header, radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
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
      pieces$header, pieces$image, body_vertical, pieces$footer
    ))
  }

  if(layout == "label-above") {
    return(htmltools::div(
      class = card_class(gutter, tags),
      style = card_style(corners),
      pieces$header, body_vertical, pieces$image, pieces$footer
    ))
  }
}


layout_card_singleton <- function(title, text, image, link,
                                  footer, header, tags, layout,
                                  padding, gutter, breakpoint,
                                  colour, border, radius) {

  corners <- card_corners(layout, footer, header, radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  if(layout == "label-only") {
    body_vertical <- htmltools::div(
      class = body_vertical_class(padding),
      style = body_vertical_style(colour, corners, border),
      pieces$title, pieces$text
    )
    return(htmltools::div(
      class = card_class(gutter),
      style = card_style(corners),
      pieces$header, body_vertical, pieces$footer
    ))
  }

  if(layout == "image-only") {
    return(htmltools::div(
      class = card_class(gutter, tags),
      style = card_style(corners),
      pieces$header, pieces$image, pieces$footer
    ))
  }
}




layout_card_horizontal <- function(title, text, image, link,
                                   footer, header, tags, layout,
                                   padding, gutter, breakpoint,
                                   colour, border, radius) {

  corners <- card_corners(layout, footer, header, radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

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
    class = row_horizontal_class(),
    style = row_horizontal_style(corners, border),
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
    pieces$header, body_horizontal, pieces$footer
  ))
}



layout_card_inset <- function(title, text, image, link,
                              footer, header, tags, layout,
                              padding, gutter, breakpoint,
                              colour, border, radius) {

  corners <- card_corners(layout, footer, header, radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  label_inner_wrapper <- htmltools::div(
    class = "my-auto",
    pieces$title, pieces$text
  )

  label_outer_wrapper <- htmltools::div(
    class = "d-flex flex-column h-100",
    label_inner_wrapper
  )

  label_inset <- htmltools::div(
    class = label_inset_class(),
    style = label_inset_style(colour, corners, border, breakpoint, layout),
    label_outer_wrapper
  )

  body_inset <- htmltools::div(
    style = body_inset_style(corners),
    pieces$image, label_inset
  )

  return(htmltools::div(
    class = card_class(gutter, tags),
    style = card_style(corners),
    pieces$header, body_inset, pieces$footer
  ))
}



