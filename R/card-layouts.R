

layout_card_vertical <- function(title, text, image, link,
                                 footer, header, tags, layout,
                                 padding, spacing, breakpoint,
                                 label_colour, border, border_radius) {

  corners <- card_corners(layout, footer, header, border_radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  label_vertical <- htmltools::div(
    class = label_vertical_class(padding),
    style = label_vertical_style(label_colour, corners, border),
    pieces$title, pieces$text
  )

  if(layout == "label-below") {above <- pieces$image; below <- label_vertical}
  if(layout == "label-above") {below <- pieces$image; above <- label_vertical}

  return(htmltools::div(
    class = card_class(tags),
    style = card_style(spacing, corners),
    pieces$header, above, below, pieces$footer
  ))
}


layout_card_labelonly <- function(title, text, image, link,
                                  footer, header, tags, layout,
                                  padding, spacing, breakpoint,
                                  label_colour, border, border_radius) {

  corners <- card_corners(layout, footer, header, border_radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  label_vertical <- htmltools::div(
    class = label_vertical_class(padding),
    style = label_vertical_style(label_colour, corners, border),
    pieces$title, pieces$text
  )

  return(htmltools::div(
    class = card_class(tags),
    style = card_style(spacing, corners),
    pieces$header, label_vertical, pieces$footer
  ))
}


layout_card_imageonly <- function(title, text, image, link,
                                  footer, header, tags, layout,
                                  padding, spacing, breakpoint,
                                  label_colour, border, border_radius) {

  corners <- card_corners(layout, footer, header, border_radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  return(htmltools::div(
    class = card_class(tags),
    style = card_style(spacing, corners),
    pieces$header, pieces$image, pieces$footer
  ))
}



layout_card_horizontal <- function(title, text, image, link,
                                   footer, header, tags, layout,
                                   padding, spacing, breakpoint,
                                   label_colour, border, border_radius) {

  corners <- card_corners(layout, footer, header, border_radius)
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
    class = body_horizontal_class(padding),
    style = body_horizontal_style(label_colour, corners, border),
    row_horizontal
  )

  return(htmltools::div(
    class = card_class(tags),
    style = card_style(spacing, corners),
    pieces$header, body_horizontal, pieces$footer
  ))
}



layout_card_inset <- function(title, text, image, link,
                              footer, header, tags, layout,
                              padding, spacing, breakpoint,
                              label_colour, border, border_radius) {

  corners <- card_corners(layout, footer, header, border_radius)
  pieces <- card_pieces(title, text, image, link, footer, header,
                        layout, border, corners)

  # defensive coding!
  rm(title, text, image, footer, header)

  label_inner_wrapper <- htmltools::div(
    class = "mb-auto",
    pieces$title, pieces$text
  )

  label_outer_wrapper <- htmltools::div(
    class = "d-flex flex-column h-100",
    label_inner_wrapper
  )

  label_inset <- htmltools::div(
    class = label_inset_class(),
    style = label_inset_style(label_colour, corners, border, breakpoint, layout),
    label_outer_wrapper
  )

  body_inset <- htmltools::div(
    style = body_inset_style(corners),
    pieces$image, label_inset
  )

  return(htmltools::div(
    class = card_class(tags),
    style = card_style(spacing, corners),
    pieces$header, body_inset, pieces$footer
  ))
}



