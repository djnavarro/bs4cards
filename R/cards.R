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

  cardlist <- build_card_list(carddata, cardspec[["width"]], cardspec[["gutter"]])
  taglist <- build_tag_list(carddata[["tags"]])

  return(htmltools::div(taglist, cardlist))
}


build_tag_list <- function(tags) {
  if(is_na(tags[[1]])) return(NULL)
  categories <- unique_strings(tags)
  if(length(categories) == 0) return(NULL)
  taglist <- lapply(categories, tag_button)
  taglist <- do.call(tag_wrapper, taglist)
  return(taglist)
}


# transpose data frame to get list of parameters, then
# construct a card from each parameter set, then
# wrap all the cards in a row to form the deck
build_card_list <- function(card_data, width, gutter) {
  card_data <- lapply(1:nrow(card_data), function(x) card_data[x, ])
  card_list <- lapply(card_data, function(x) do.call(make_card, x))
  card_deck <- do.call(row_wrap(width, gutter), card_list)
  return(card_deck)
}

row_wrap <- function(width, gutter) {
  function(...) {
    htmltools::div(class = outer_row_class(width, gutter), ...)
  }
}

unique_strings <- function(x) {
  unique(unlist(strsplit(x, split = "[[:space:]]+")))
}

tag_button <- function(tag) {
  htmltools::tags$button(
    class = "btn btn-primary",
    type = "button",
    onClick = paste0(
      "$('.all').hide(400, 'swing');",
      "setTimeout(function() {$('.", tag, "').show(400, 'swing')}, 400);"
    ),
    tag
  )
}


tag_wrapper <- function(...) {
  htmltools::p(...)
}

# should take inputs that match the columns in carddata,
# but not every variable gets used
make_card <- function(title, text, image, link, footer, header, tags,
                      width, layout, padding, gutter, breakpoint, colour,
                      border_width, border_colour, rounding){

  border <- c(width = border_width, colour = border_colour, style = "solid")
  radius <- rounding;

  if(layout == "label-below" | layout == "label-above") {
    card <- layout_card_vertical(
      title, text, image, link,
      footer, header, tags, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }

  if(layout == "label-only" | layout == "image-only") {
    card <- layout_card_singleton(
      title, text, image, link,
      footer, header, tags, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }

  if(layout == "label-right" | layout == "label-left") {
    card <- layout_card_horizontal(
      title, text, image, link,
      footer, header, tags, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }

  if(layout == "inset-bottom" | layout == "inset-top") {
    card <- layout_card_inset(
      title, text, image, link,
      footer, header, tags, layout,
      padding, gutter, breakpoint,
      colour, border, radius
    )
    return(card)
  }
}

