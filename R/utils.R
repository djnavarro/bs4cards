
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

