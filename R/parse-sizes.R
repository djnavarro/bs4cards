

# width = 3,
# spacing = 2,
# breakpoint = 7,
# border_width = 1,
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
  breakpoint/12
}

parse_borderwidth <- function(border_width) {
  if(is_character(border_width)) return(border_width)
  if(border_width == 0) return("0")
  if(border_width == 1) return("1px")
  if(border_width == 2) return("2px")
  if(border_width == 3) return("4px")
  if(border_width == 4) return("6px")
  if(border_width == 5) return("8px")
}

parse_rounding <- function(rounding) {
  if(is_character(rounding)) return(rounding)
  if(rounding == 0) return("0")
  if(rounding == 1) return(".1rem")
  if(rounding == 2) return(".2rem")
  if(rounding == 3) return(".3rem")
  if(rounding == 4) return(".4rem")
  if(rounding == 5) return(".5rem")
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


