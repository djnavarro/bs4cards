#' Specifies a bootstrap card
#'
#' @param data Data
#' @param title Title for the card
#' @param text Text for the card
#' @param image Path to the card image
#' @param link URL to link to from title and image
#' @param footer Card footer
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

  card_list <- data %>%
    dplyr::transmute(
      title  = {{title}},
      text   = {{text}},
      image  = {{image}},
      link   = {{link}},
      footer = {{footer}},
      layout = {{layout}},
      padding = {{padding}},
      gutter = {{gutter}},
      breakpoint = {{breakpoint}},
      colour = {{colour}},
      border_width = {{border_width}},
      border_colour = {{border_colour}},
      rounding = {{rounding}}
    )

  card_list <- card_list %>%
    purrr::transpose() %>%
    purrr::map(make_card_dots)

  collate <- function(...) {
    row_margins <- paste(
      "my-1",
      ifelse(gutter == 0, "mx-0", paste0("mx-n", gutter))
    )
    htmltools::div(
      class = paste("row p-0", column_width_class(width), row_margins),
      ...
    )
  }

  do.call(collate, card_list)
}



make_card <- function(title = NULL, text = NULL, image = NULL, link = NULL,
                      footer = NULL, header = NULL, layout,
                      padding, gutter, breakpoint = NULL, colour,
                      border_width, border_colour, rounding
                      ) {

  border <- c(width = border_width, colour = border_colour, style = "solid")
  radius <- rounding;

  if(layout == "label-below" | layout == "label-above") {
    card <- make_card_vertical(
      title, text, image, link,
      footer, header, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }

  if(layout == "label-right" | layout == "label-left") {
    card <- make_card_horizontal(
      title, text, image, link,
      footer, header, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }

  if(layout == "inset-bottom" | layout == "inset-top") {
    card <- make_card_inset(
      title, text, image, link,
      footer, header, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }
}

make_card_dots <- purrr::lift_dl(make_card)

