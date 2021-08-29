
# ---- default values ----
# width = 3
# spacing = 2
# breakpoint = 4
# border_width = 1
# rounding = 3


parse_width <- function(width){
  if(is_character(width)) return(width)
  if(width == 0) abort("width of a card cannot be 0")
  if(width == 1) return("row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6")
  if(width == 2) return("row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4")
  if(width == 3) return("row-cols-1 row-cols-md-2 row-cols-lg-3")
  if(width == 4) return("row-cols-1 row-cols-lg-2")
  if(width == 5) return("row-cols-1")
}

parse_breakpoint <- function(breakpoint, layout) {

  if(layout == "label-left" | layout == "label-right") {
    if(breakpoint == 1) return("col-4")
    if(breakpoint == 2) return("col-5")
    if(breakpoint == 3) return("col-6")
    if(breakpoint == 4) return("col-7")
    if(breakpoint == 5) return("col-8")
  }

  if(layout == "inset-top" | layout == "inset-bottom") {
    if(breakpoint == 1) return(3/12)
    if(breakpoint == 2) return(4/12)
    if(breakpoint == 3) return(5/12)
    if(breakpoint == 4) return(6/12)
    if(breakpoint == 5) return(7/12)
  }

}

parse_border_width <- function(border_width) {
  if(is_character(border_width)) return(border_width)
  if(border_width == 0) return("0")
  if(border_width == 1) return("1px")
  if(border_width == 2) return("2px")
  if(border_width == 3) return("4px")
  if(border_width == 4) return("6px")
  if(border_width == 5) return("8px")
}

parse_border_radius <- function(rounding) {
  if(is_character(rounding)) return(rounding)
  if(rounding == 0) return("0")
  if(rounding == 1) return(".2rem")
  if(rounding == 2) return(".4rem")
  if(rounding == 3) return(".6rem")
  if(rounding == 4) return(".8rem")
  if(rounding == 5) return("1rem")
}

parse_spacing <- function(spacing) {
  if(is_character(spacing)) return(spacing)
  if(spacing == 0) return("0")
  if(spacing == 1) return(".1rem")
  if(spacing == 2) return(".2rem")
  if(spacing == 3) return(".4rem")
  if(spacing == 4) return(".6rem")
  if(spacing == 5) return("1rem")
}


parse_colour <- function(colours, var) {
  unname(vapply(colours, col2hex, "#ffffffff", var = var))
}

col2hex <- function(name, var) {
  col_matrix <- try(grDevices::col2rgb(name, alpha = TRUE), silent = TRUE)
  if(methods::is(col_matrix, "try-error")) abort(paste("invalid RGB specification in", var))
  col_string <- grDevices::rgb(
    red   = col_matrix[1, ]/255,
    green = col_matrix[2, ]/255,
    blue  = col_matrix[3, ]/255,
    alpha = col_matrix[4, ]/255
  )
  return(col_string)
}



