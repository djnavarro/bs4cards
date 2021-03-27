
add_s3_class <- function(x, name) {
  class(x) <- c(class(x), name)
  return(x)
}

as_card_part <- function(x, part, ...) {
  class_name <- paste0("bs4card.", part)
  if(methods::is(x, class_name)) {
    return(x)
  }
  part_fn <- eval(str2lang(paste0("card_", part)))
  return(part_fn(x, ...))
}

#' Construct bootstrap column classes
#'
#' @param base Default number of columns
#' @param small Number of columns on small devices
#' @param medium Number of columns on medium devices
#' @param large Number of columns on large devices
#' @param extra_large Number of columns on extra_large devices
#' @param more Additional classes to add
#'
#' @return
#' @export
#'
#' @examples
bs_col <- function(base = 12, small = NULL, medium = NULL, large = NULL, extra_large = NULL, more = NULL) {
  col_class <- paste0("col-", base)
  if(!is.null(small))       col_class <- paste0(col_class, " col-sm-", small)
  if(!is.null(medium))      col_class <- paste0(col_class, " col-md-", medium)
  if(!is.null(large))       col_class <- paste0(col_class, " col-lg-", large)
  if(!is.null(extra_large)) col_class <- paste0(col_class, " col-xl-", extra_large)
  if(!is.null(more))        col_class <- paste0(col_class, " ", more)
  return(col_class)
}


#' Construct bootstrap margin classes
#'
#' @param base Margin size
#' @param bottom Margin size on bottom
#' @param top Margin size on top
#' @param left Margin size on left
#' @param right Margin size on right
#'
#' @return
#' @export
#'
#' @examples
bs_mar <- function(base = 0, bottom = NULL, top = NULL, left = NULL, right = NULL) {
  mar_class <- paste0("m-", base)
  if(!is.null(bottom)) mar_class <- paste0(mar_class, " mb-", bottom)
  if(!is.null(top))    mar_class <- paste0(mar_class, " mt-", top)
  if(!is.null(left))   mar_class <- paste0(mar_class, " ml-", left)
  if(!is.null(right))  mar_class <- paste0(mar_class, " mr-", right)
  return(mar_class)
}


#' Construct bootstrap padding classes
#'
#' @param base Padding size
#' @param bottom Padding size on bottom
#' @param top Padding size on top
#' @param left Padding size on left
#' @param right Padding size on right
#'
#' @return
#' @export
#'
#' @examples
bs_pad <- function(base = 0, bottom = NULL, top = NULL, left = NULL, right = NULL) {
  pad_class <- paste0("p-", base)
  if(!is.null(bottom)) pad_class <- paste0(pad_class, " pb-", bottom)
  if(!is.null(top))    pad_class <- paste0(pad_class, " pt-", top)
  if(!is.null(left))   pad_class <- paste0(pad_class, " pl-", left)
  if(!is.null(right))  pad_class <- paste0(pad_class, " pr-", right)
  return(pad_class)
}


#' Sample a placekitten image URL
#'
#' @return A string containing the URL
#' @export
#'
sample_kitten <- function() {
  pixels_wide <- sample(250:350, 1)
  pixels_high <- sample(150:250, 1)
  kitten <- paste("https://placekitten.com", pixels_wide, pixels_high, sep = "/")
  return(kitten)
}


#' Sample lorem ipsum text
#'
#' @return A string containing the text
#' @export
#'
sample_lorem <- function() {
  con <- url("https://loripsum.net/api/short/plaintext/1")
  text <- readLines(con) %>%
    paste(collapse = "") %>%
    gsub(pattern = " *$", replacement = "", x = .)
  close(con)
  return(text)
}
