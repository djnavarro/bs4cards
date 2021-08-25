

# cards -------------------------------------------------------------------


outer_row_class <- function(width, gutter) {
  paste("row p-0", column_width_class(width), row_margins_class(gutter))
}

column_width_class <- function(width){
  if(width == "narrow") return("row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6")
  if(width == "medium") return("row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4")
  if(width == "wide") return("row-cols-1 row-cols-md-2 row-cols-lg-3")
  if(width == "very-wide") return("row-cols-1 row-cols-lg-2")
  return(width)
}

row_margins_class <- function(gutter) {
  paste("my-1", ifelse(gutter == 0, "mx-0", paste0("mx-n", gutter)))
}

border_width_style <- function(width, top = TRUE, right = TRUE, bottom = TRUE, left = TRUE) {
  border_widths <- rep("0", 4)
  border_widths[c(top, right, bottom, left)] <- width
  border_widths <- paste(border_widths, collapse = " ")
  return(border_widths)
}

card_class <- function(gutter, tags = "") {
  paste0("card d-flex flex-column bg-transparent m-0 p-", gutter, " border-0 collapse.show ", tags)
}




# text and titles ---------------------------------------------------------


title_class <- function(has_text) {
  base <- "card-title my-auto px-3 pt-3"
  bottom <- ifelse(has_text, "pb-1", "pb-3")
  return(paste(base, bottom))
}

text_class <- function(has_title) {
  base <- "card-text my-auto px-3 pb-3"
  top <- ifelse(has_title, "pt-1", "pt-3")
  return(paste(base, top))
}


card_style <- function(corners) {
  corners[["card"]]
}



# images ------------------------------------------------------------------

image_class <- function(layout) {
  card_type <- "card-img"
  if(layout == "label-above") card_type <- "card-img-bottom"
  if(layout == "label-below") card_type <- "card-img-top"
  paste0(card_type)
}

# note: refactor later...
# all these conditionals suggest that image style needs to be broken into
# separate functions for each layout type!
image_style <- function(corners, border, layout) {
  border_widths <- border[["width"]]
  if(layout == "label-above") border_widths <- border_width_style(border[["width"]], top = FALSE)  # avoid duplicates
  if(layout == "label-below") border_widths <- border_width_style(border[["width"]], bottom = FALSE)
  #  if(layout == "label-left")  border_widths <- border_width_style(border[["width"]], top = FALSE, right = FALSE)
  # if(layout == "label-right") border_widths <- border_width_style(border[["width"]], top = FALSE, left = FALSE)
  paste0(
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border_widths, "; ",
    if(layout == "label-left")  {
      paste0(
        "margin-left: ", border[["width"]], ";",
        "margin-right: -", border[["width"]], ";",
        "margin-top: -", border[["width"]], ";",
        "margin-bottom: -", border[["width"]], ";"
      )
    },
    if(layout == "label-right") {
      paste0(
        "margin-left: -", border[["width"]], ";",
        "margin-right: -", border[["width"]], ";",
        "margin-top: -", border[["width"]], ";",
        "margin-bottom: -", border[["width"]], ";"
      )
    },
    corners[["image"]]
  )
}




# vertical layouts --------------------------------------------------------

label_vertical_class <- function(padding) {
  paste0("card-body justify-content-end m-0 p-", padding)
}

label_vertical_style <- function(colour, corners, border) {
  paste0(
    "visibility: visible; ",
    "background-color: ", colour, "; ",
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border[["width"]], "; ",
    corners[["label"]]
  )
}

# horizontal layouts ------------------------------------------------------


label_horizontal_class <- function(breakpoint) {
  paste0("col-", round(breakpoint * 12), " h-100")
}

row_horizontal_style <- function(corners, border) {
  paste(
    corners[["core"]]
  )
}

row_horizontal_class <- function() {
  "row no-gutters h-100 border-0"
}

body_horizontal_class <- function(padding) {
  paste0("card-body m-0 p-", padding, " col-12")
}

body_horizontal_style <- function(colour, corners, border) {
  paste0(
    "visibility: visible; ",
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border[["width"]], "; ",
    "background-color: ", colour, ";",
    corners[["core"]]
  )
}

image_horizontal_class <- function(breakpoint) {
  paste0("col-", 12 - round(breakpoint * 12))
}

image_horizontal_style <- function(corners) { # border already styled by image
  corners[["image"]]
}




# inset layouts -----------------------------------------------------------


body_inset_style <- function(corners) {
  paste(
    "position: relative;",
    corners[["label"]]
  )
}

label_inset_class <- function() {
  "card-img-overlay p-0 m-0"
}

label_inset_style <- function(colour, corners, border, breakpoint, layout) {
  height <- round(breakpoint * 100)
  paste0(
    "overflow: hidden;",
    "background-color: ", colour, ";",
    "height: ", height, "%;",
    "position: absolute;",
    "top: ", ifelse(layout == "inset-bottom", 100 - height, 0), "%;",
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border[["width"]], "; ",
    corners[["label"]]
  )
}




# headers and footers -----------------------------------------------------


footer_class <- function() {
  paste0("card-footer small text-muted px-3 py-auto")
}

footer_style <- function(corners, border) {
  paste0(
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border_width_style(border[["width"]], top = FALSE), "; ",
    corners[["footer"]]
  )
}

header_class <- function() {
  paste0("card-header small text-muted px-3 py-auto")
}

header_style <- function(corners, border) {
  paste0(
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border_width_style(border[["width"]], bottom = FALSE), "; ",
    corners[["header"]]
  )
}

