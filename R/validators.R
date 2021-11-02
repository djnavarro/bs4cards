
# general purpose functions -----------------------------------------------


check_valid_veclength <- function(x, n, var) {
  err <- paste(
    var, "must be vector of length 1 or equal to the number of cards"
  )
  if(is_null(x)) return(NULL)
  if(length(x) == 1) return(NULL)
  if(length(x) == n) return(NULL)
  abort(err)
}

is_scalar_numeric <- function(x) {
  is_scalar_double(x) || is_scalar_integer(x)
}


# layout validator --------------------------------------------------------


check_valid_layout <- function(layout) {
  err <- 'unrecognised value for layout'
  if(!is_scalar_character(layout)) abort(err)
  if(layout %in% c("label-above", "label-below", "label-left",
                   "label-right", "inset-top", "inset-bottom", "label-only",
                   "image-only")) return(NULL)
  abort(err)
}


# validators for size-related parameters ----------------------------------


check_valid_width <- function(width) {
  if(is_scalar_character(width)) return(NULL)
  if(is_scalar_numeric(width) && width %in% 1:5) return(NULL)
  abort("width must be an integer between 1 and 5")
}

check_valid_padding <- function(padding) {
  if(is_scalar_numeric(padding) && padding %in% 0:5) return(NULL)
  abort("padding must be an integer between 0 and 5")
}

check_valid_spacing <- function(spacing) {
  err <- "spacing must be an integer between 0 and 5"
  if(is_scalar_numeric(spacing) && spacing %in% 0:5) return(NULL)
  abort(err)
}

check_valid_breakpoint <- function(breakpoint) {
  err <- "breakpoint must be an integer between 1 and 5"
  if(is_scalar_numeric(breakpoint) && breakpoint %in% 1:5) return(NULL)
  abort(err)
}

check_valid_border_width <- function(border_width, n) {
  if(is_null(border_width)) abort("border_width cannot be NULL")
  if(is_scalar_character(border_width)) return(NULL)
  if(is_scalar_numeric(border_width) && border_width %in% 0:5) return(NULL)
  abort("border_width must be an integer between 0 and 5")
}

check_valid_border_radius <- function(border_radius, n) {
  if(is_null(border_radius)) abort("border_radius cannot be NULL")
  if(is_scalar_character(border_radius)) return(NULL)
  if(is_scalar_numeric(border_radius) && border_radius %in% 0:5) return(NULL)
  abort("border_radius must be an integer between 0 and 5")
}




# validators for colour parameters ----------------------------------------


# these need to be more precise later...
check_valid_label_colour <- function(x, n) {
  if(!is_character(x)) abort("label_colour must be character")
  check_valid_veclength(x, n, "label_colour")
}

check_valid_border_colour <- function(x, n) {
  if(is_null(x)) abort("border_colour must be character")
  if(!is_character(x)) abort("border_colour must be character")
  check_valid_veclength(x, n, "border_colour")
}



