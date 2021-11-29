

build_card_row <- function(data) {

  # transpose input data to get list of card parameters, then
  # construct a card from each parameter set
  card_data <- lapply(1:nrow(data), function(x) data[x, ])
  card_list <- lapply(card_data, function(x) do.call(build_card, x))

  # define function to wrap all cards in a row, then call it
  row_wrapper <- row_wrap(
    width = data[["width"]][[1]],
    spacing = data[["spacing"]][[1]]
  )
  return(do.call(row_wrapper, card_list))
}

build_card <- function(title, text, image, link, footer, header, tags,
                       width, layout, padding, spacing, breakpoint, label_colour,
                       border_width, border_colour, border_radius){

  layout_card <- switch(
    layout,
    "label-below"  = layout_card_vertical,
    "label-above"  = layout_card_vertical,
    "label-only"   = layout_card_labelonly,
    "image-only"   = layout_card_imageonly,
    "label-right"  = layout_card_horizontal,
    "label-left"   = layout_card_horizontal,
    "inset-top"    = layout_card_inset,
    "inset-bottom" = layout_card_inset,
    stop("Unknown card layout: ", layout)
  )

  border <- list(
    width = border_width,
    colour = border_colour,
    style = "solid"
  )

  return(layout_card(
    title, text, image, link,
    footer, header, tags, layout,
    padding, spacing, breakpoint,
    label_colour, border, border_radius
  ))
}

row_wrap <- function(width, spacing) {
  function(...) {
    htmltools::div(
      class = outer_row_class(width),
      style = outer_row_style(spacing),
      ...
    )
  }
}


