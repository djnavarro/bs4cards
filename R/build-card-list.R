
# transpose data frame to get list of parameters, then
# construct a card from each parameter set, then
# wrap all the cards in a row to form the deck
build_card_list <- function(data, width, gutter) {
  card_data <- lapply(1:nrow(data), function(x) data[x, ])
  card_list <- lapply(card_data, function(x) do.call(make_card, x))
  card_deck <- do.call(row_wrap(width, gutter), card_list)
  return(card_deck)
}

row_wrap <- function(width, gutter) {
  function(...) {
    htmltools::div(class = outer_row_class(width, gutter), ...)
  }
}

make_card <- function(title, text, image, link, footer, header, tags,
                      width, layout, padding, gutter, breakpoint, colour,
                      border_width, border_colour, rounding){

  border <- c(
    width = border_width,
    colour = border_colour,
    style = "solid"
  )

  if(layout == "label-below")  layout_card <- layout_card_vertical
  if(layout == "label-above")  layout_card <- layout_card_vertical
  if(layout == "label-only")   layout_card <- layout_card_labelonly
  if(layout == "image-only")   layout_card <- layout_card_imageonly
  if(layout == "label-right")  layout_card <- layout_card_horizontal
  if(layout == "label-left")   layout_card <- layout_card_horizontal
  if(layout == "inset-top")    layout_card <- layout_card_inset
  if(layout == "inset-bottom") layout_card <- layout_card_inset

  return(layout_card(
    title, text, image, link,
    footer, header, tags, layout,
    padding, gutter, breakpoint,
    colour, border, radius = rounding
  ))
}

