

build_tag_list <- function(tags) {
  if(is_na(tags[[1]])) return(NULL)
  categories <- unique_strings(tags)
  if(length(categories) == 0) return(NULL)
  taglist <- lapply(categories, tag_button)
  taglist <- do.call(tag_wrapper, taglist)
  return(taglist)
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
