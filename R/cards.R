#' Specifies a bootstrap card
#'
#' @param data Data
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param link URL to link to from title and image
#' @param footer Card footer
#' @param header Card header
#' @param tags Tags to be assigned to each card
#' @param layout Card layout is a string, defaults to "label-below" (see details)
#' @param width Card width is an integer between 1 and 5
#' @param spacing Spacing between cards is an integer between 0 and 5
#' @param breakpoint Number between 1 and 5, controlling label size on horizontal and inset layouts
#' @param border_colour Colour applied to the card border
#' @param label_colour Colour applied to the card label
#' @param border_width Width of card border is an integer between 0 and 5
#' @param rounding Amount of rounding on card corners is an integer between 0 and 5
#'
#' @return A "shiny.tag" object
#' @export
#'
cards <- function(data,
                  title = NULL,
                  text = NULL,
                  image = NULL,
                  link = NULL,
                  footer = NULL,
                  header = NULL,
                  tags = NULL,
                  layout = "label-below",
                  width = 3,
                  spacing = 2,
                  breakpoint = 4,
                  label_colour = "#ffffffaa",
                  border_colour = "#808080",
                  border_width = 1,
                  rounding = 3
) {

  quosures <- enquos(
    title = title,
    text = text,
    image = image,
    link = link,
    footer = footer,
    header = header,
    tags = tags,
    width = width,
    layout = layout,
    gutter = spacing,
    breakpoint = breakpoint,
    colour = label_colour,
    border_width = border_width,
    border_colour = border_colour,
    rounding = rounding
  )

  card_spec <- lapply(quosures, function(x) eval_tidy(x, data = data))
  card_spec$padding <- 0

  card_data <- build_card_data(card_spec, nrow(data))
  card_row <- build_card_row(card_data)
  tag_list <- build_tag_list(card_data[["tags"]])

  return(htmltools::div(tag_list, card_row))
}

