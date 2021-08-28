#' Builds a deck of bootstrap cards
#'
#' @param data Data frame
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
#' @param label_colour Colour applied to the card label
#' @param border_colour Colour applied to the card border
#' @param border_width Width of card border is an integer between 0 and 5
#' @param border_radius Amount of rounding on card corners is an integer between 0 and 5
#'
#' @details
#' This function constructs the HTML necessary to specify a deck of bootstrap 4
#' cards suitable for inclusion within an R markdown document. It takes a data
#' frame as the first argument, with one row for each card to be generated.
#'
#' Cards are specified using the \code{title}, \code{text}, \code{image},
#' \code{link}, \code{footer}, \code{header}, and \code{tags} arguments. These
#' arguments take expressions to be evaluated using the user-supplied
#' \code{data}, and should evaluate to character vectors that have length 1 or
#' the same number of rows as \code{data}.
#'
#' The \code{layout} argument is a single character string specifying the
#' layout of the cards: possible values are "label-below" (the default),
#' "label-above", "label-left", "label-right", "label-only", "image-only",
#' "inset-top", "inset-bottom".
#'
#' The \code{width}, \code{spacing}, \code{breakpoint}, \code{border_width},
#' and \code{border_radius} arguments all take integer inputs specifying
#' the visual appearance of the cards. Allowed values range from 0 to 5, except
#' for \code{width} and \code{breakpoint} which cannot be 0. The other two
#' arguments \code{label_colour} and \code{border_colour} take a single string
#' specifying colours of the relevant parts of the card.
#'
#' @return A "shiny.tag" object containing the HTML for the card deck
#' @export
#'
#' @examples
#' \dontrun{
#' galleries %>%
#'   cards(
#'     title = long_name,
#'     text = blurb,
#'     image = image_url,
#'     link = gallery_url
#'   )
#' }
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
                  border_radius = 3
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
    spacing = spacing,
    breakpoint = breakpoint,
    label_colour = label_colour,
    border_width = border_width,
    border_colour = border_colour,
    border_radius = border_radius
  )

  card_spec <- lapply(quosures, function(x) eval_tidy(x, data = data))
  card_spec$padding <- 0 # hack

  card_data <- build_card_data(card_spec, nrow(data))
  card_row <- build_card_row(card_data)
  tag_list <- build_tag_list(card_data[["tags"]])

  return(htmltools::div(tag_list, card_row))
}

