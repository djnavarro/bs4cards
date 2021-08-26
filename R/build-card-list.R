

build_card_row <- function(data) {

  # transpose input data to get list of card parameters, then
  # construct a card from each parameter set
  card_data <- lapply(1:nrow(data), function(x) data[x, ])
  card_list <- lapply(card_data, function(x) do.call(build_card, x))

  # define function to wrap all cards in a row, then call it
  row_wrapper <- row_wrap(
    width = data[["width"]][[1]],
    gutter = data[["gutter"]][[1]]
  )
  return(do.call(row_wrapper, card_list))
}

build_card <- function(title, text, image, link, footer, header, tags,
                       width, layout, padding, gutter, breakpoint, colour,
                       border_width, border_colour, rounding){

  if(layout == "label-below")  layout_card <- layout_card_vertical
  if(layout == "label-above")  layout_card <- layout_card_vertical
  if(layout == "label-only")   layout_card <- layout_card_labelonly
  if(layout == "image-only")   layout_card <- layout_card_imageonly
  if(layout == "label-right")  layout_card <- layout_card_horizontal
  if(layout == "label-left")   layout_card <- layout_card_horizontal
  if(layout == "inset-top")    layout_card <- layout_card_inset
  if(layout == "inset-bottom") layout_card <- layout_card_inset

  border <- list(
    width = border_width,
    colour = border_colour,
    style = "solid"
  )

  return(layout_card(
    title, text, image, link,
    footer, header, tags, layout,
    padding, gutter, breakpoint,
    colour, border,
    radius = rounding
  ))
}

row_wrap <- function(width, gutter) {
  function(...) {
    htmltools::div(class = outer_row_class(width, gutter), ...)
  }
}


