

build_tag_list <- function(tags) {
  if(is_null(tags) || is_na(tags[[1]])) return(NULL)
  categories <- unique_tags(tags)
  if(length(categories) == 0) return(NULL)
  labels <- unique_labels(tags)
  tagdata <- lapply(1:length(labels), function(x) c(categories[x], labels[x]))
  taglist <- lapply(tagdata, tag_button)
  taglist <- do.call(tag_wrapper, taglist)
  return(taglist)
}

unique_labels <- function(x) {
  if (is_null(x) || is_na(x)) return(character())
  s <- unlist(strsplit(as.character(x), split = ";"))
  s <- gsub("^[[:space:]]+", "", s)
  s <- gsub("[[:space:]]+$", "", s)
  s <- unique(s)
  return(s)
}

unique_tags <- function(x) {
  if (is_null(x) || is_na(x)) return(character())
  #unique(unlist(strsplit(x, split = "[[:space:]]+")))
  s <- unlist(strsplit(as.character(x), split = ";"))
  s <- gsub("^[[:space:]]+", "", s)
  s <- gsub("[[:space:]]+$", "", s)
  s <- gsub("[[:space:]]+", "-", s)
  s <- unique(s)
  s <- paste0("bs4cards-", s)
  return(s)
}

tag_button <- function(x) {
  return(htmltools::tags$button(
    class = "btn btn-primary",
    type = "button",
    onClick = paste0(
      "$('.bs4cards-blahblahblah').hide(400, 'swing');",
      "setTimeout(function() {$('.", x[[1]], "').show(400, 'swing')}, 400);"
    ),
    x[[2]]
  ))
}

tag_wrapper <- function(...) {
  htmltools::p(...)
}
