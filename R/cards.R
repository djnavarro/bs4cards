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
#' @param width Card width ("narrow", "medium", "wide")
#' @param layout Card layout ("label-above", "label-below", "label-left", "label-right", "inset-top", "inset-bottom")
#' @param padding Spacing between parts of the card (integer between 0 and 5)
#' @param gutter Spacing between adjacent cards (integer between 0 and 5)
#' @param breakpoint Position to insert breaks for horizontal or inset cards, interpreted as proportion of card allocated to label
#' @param colour Colour applied to the card (interpretation depends on layout)
#' @param border_width Width of card border
#' @param border_colour Colour of card border
#' @param rounding Amount of rounding on card corners
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
                  width = "medium",
                  layout = "label-below",
                  padding = 0,
                  gutter = 1,
                  breakpoint = NULL,
                  colour = "#ffffffaa",
                  border_width = "1px",
                  border_colour = "#808080",
                  rounding = "1rem"
                  ) {

  quosures <- enquos(
    title = title, text = text, image = image, link = link, footer = footer,
    header = header, tags = tags, width = width, layout = layout,
    padding = padding, gutter = gutter, breakpoint = breakpoint,
    colour = colour, border_width = border_width, border_colour = border_colour,
    rounding = rounding
  )
  cardspec <- lapply(quosures, function(x) eval_tidy(x, data = data))
  cardspec <- validate_cardspec(cardspec, nrow(data))
  carddata <- as.data.frame(cardspec)

  cardlist <- build_card_list(
    data = carddata,
    width = cardspec[["width"]],
    gutter = cardspec[["gutter"]]
  )
  taglist <- build_tag_list(carddata[["tags"]])

  return(htmltools::div(taglist, cardlist))
}

