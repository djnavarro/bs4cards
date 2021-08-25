
validate_cardspec <- function(cardspec, n) {

  # check that the user has specified image and/or label
  no_image <- is_null(cardspec[["image"]])
  no_label <- is_null(cardspec[["title"]]) & is_null(cardspec[["text"]])
  if(no_image & no_label) abort("cards must have an image or a label")

  # check that valid "deck properties" have been input
  check_valid_layout(cardspec[["layout"]])
  check_valid_width(cardspec[["width"]])
  check_valid_padding(cardspec[["padding"]])
  check_valid_gutter(cardspec[["gutter"]])
  check_valid_breakpoint(cardspec[["breakpoint"]])

  # clean up values as necessary
  cardspec[["layout"]] <- clean_layout(cardspec[["layout"]], no_image, no_label)
  cardspec[["breakpoint"]] <- clean_breakpoint(cardspec[["breakpoint"]], cardspec[["layout"]])

  # check that valid "card data" has been input and replace NULL with NA
  data_inputs <- c("title", "text", "image", "link", "footer", "header", "tags")
  for(input in data_inputs) {
    check_valid_input(cardspec[[input]], n, input)
    cardspec[[input]] <- cardspec[[input]] %||% NA_character_
  }

  # check that valid "card properties" have been input
  check_valid_colour(cardspec[["colour"]], n)
  check_valid_border_width(cardspec[["border_width"]], n)
  check_valid_border_colour(cardspec[["border_colour"]], n)
  check_valid_rounding(cardspec[["rounding"]], n)

  # coerce to data frame
  carddata <- as.data.frame(cardspec)

  return(carddata)
}

is_scalar_numeric <- function(x) {
  is_scalar_double(x) || is_scalar_integer(x)
}

check_valid_layout <- function(layout) {
  err <- 'unrecognised value for layout'
  if(!is_scalar_character(layout)) abort(err)
  if(layout %in% c("label-above", "label-below", "label-left",
                   "label-right", "inset-top", "inset-bottom", "label-only",
                   "image-only")) return(NULL)
  abort(err)
}

check_valid_width <- function(width) {
  err <- "width must be a single character string"
  if(!is_scalar_character(width)) abort(err)
}

check_valid_padding <- function(padding) {
  if(is_scalar_numeric(padding) && padding %in% 0:5) return(NULL)
  abort("padding must be an integer between 0 and 5")
}

check_valid_gutter <- function(gutter) {
  err <- "gutter must be an integer between 0 and 5"
  if(is_scalar_numeric(gutter) && gutter %in% 0:5) return(NULL)
  abort(err)
}

check_valid_breakpoint <- function(breakpoint) {
  if(is_null(breakpoint)) return(NULL)
  if(is_scalar_numeric(breakpoint)) return(NULL)
  abort("breakpoint must be a single number")
}

check_valid_input <- function(x, n, var) {
  err <- paste(
    var, "must be character vector of length 1 or equal to the number of cards"
  )
  if(is_null(x)) return(NULL)
  if(!is_character(x)) abort(err)
  if(length(x) == 1) return(NULL)
  if(length(x) == n) return(NULL)
  abort(err)
}

# these need to be more precise later...
check_valid_colour <- function(x, n) {
  if(is_null(x)) abort("colour cannot be NULL")
  check_valid_input(x, n, "colour")
}
check_valid_border_width <- function(x, n) {
  if(is_null(x)) abort("border_width cannot be NULL")
  check_valid_input(x, n, "border_width")
}
check_valid_border_colour <- function(x, n) {
  if(is_null(x)) abort("border_colour cannot be NULL")
  check_valid_input(x, n, "border_colour")
}
check_valid_rounding <- function(x, n) {
  if(is_null(x)) abort("rounding cannot be NULL")
  check_valid_input(x, n, "rounding")
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


# the default for horizontal cards is a wide label, presuming the common
# use case for horizontal cards is for people to supply a descriptive blurb.
# the default breakpoint for inset cards is thin, as it is presumed the
# typical use case for inset cards is to provide a small floating caption/title
clean_breakpoint <- function(breakpoint, layout) {
  if(!is_null(breakpoint)) return(breakpoint)
  if(layout == "label-left") return(2/3)
  if(layout == "label-right") return(2/3)
  if(layout == "inset-top") return(.2)
  if(layout == "inset-bottom") return(.2)
  return(1)
}


# to do: use this to make a preserve_whitespace() function??
#
# htmltools::span(
#   blah,
#   style = "white-space: pre-wrap"
# )





