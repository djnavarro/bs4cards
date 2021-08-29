
build_card_data <- function(cardspec, n) {

  # check that the user has specified image and/or label
  no_image <- is_null(cardspec[["image"]])
  no_label <- is_null(cardspec[["title"]]) & is_null(cardspec[["text"]])
  if(no_image & no_label) abort("cards must have an image or a label")

  # check that valid "deck properties" have been input
  check_valid_layout(cardspec[["layout"]])
  check_valid_width(cardspec[["width"]])
  check_valid_padding(cardspec[["padding"]])
  check_valid_spacing(cardspec[["spacing"]])
  check_valid_breakpoint(cardspec[["breakpoint"]])

  # coerce the layout if needed
  cardspec[["layout"]] <- clean_layout(cardspec[["layout"]], no_image, no_label)

  # check that valid "card data" has been input and replace NULL with NA
  data_inputs <- c("title", "text", "image", "link", "footer", "header", "tags")
  for(input in data_inputs) {
    check_valid_veclength(cardspec[[input]], n, input)
    cardspec[[input]] <- cardspec[[input]] %||% NA_character_
  }

  # check that valid "card properties" have been input
  check_valid_label_colour(cardspec[["label_colour"]], n)
  check_valid_border_width(cardspec[["border_width"]], n)
  check_valid_border_colour(cardspec[["border_colour"]], n)
  check_valid_border_radius(cardspec[["border_radius"]], n)

  # convert numeric sizes to css specifications
  cardspec[["width"]] <- parse_width(cardspec[["width"]])
  cardspec[["spacing"]] <- parse_spacing(cardspec[["spacing"]])
  cardspec[["border_width"]] <- parse_border_width(cardspec[["border_width"]])
  cardspec[["border_radius"]] <- parse_border_radius(cardspec[["border_radius"]])
  cardspec[["breakpoint"]] <- parse_breakpoint(cardspec[["breakpoint"]], cardspec[["layout"]])

  # convert character input to hex rgba
  cardspec[["border_colour"]] <- parse_colour(cardspec[["border_colour"]], "border_colour")
  cardspec[["label_colour"]] <- parse_colour(cardspec[["label_colour"]], "label_colour")

  # coerce to data frame
  carddata <- as.data.frame(cardspec)

  return(carddata)
}


# if the user only specifies one of the two basic card parts
# (image & label), require that the layout value be appropriate
# and message user if needed
clean_layout <- function(layout, no_image, no_label) {

  if(no_image & layout != "label-only") {
    layout <- "label-only"
    message("using 'label-only' layout")
  }

  if(no_label & layout != "image-only") {
    layout <- "image-only"
    message("using 'image-only' layout")
  }

  return(layout)
}


# to do: use this to make a preserve_whitespace() function??
#
# htmltools::span(
#   blah,
#   style = "white-space: pre-wrap"
# )





