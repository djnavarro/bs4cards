

# cards -------------------------------------------------------------------

card_class <- function(tags = "") {
  s <- unique_tags(tags)
  s <- paste(s, collapse = " ")
  paste0("card bg-transparent m-0 border-0 collapse.show bs4cards-blahblahblah ", s)
}

card_style <- function(spacing, corners) {
  paste(
    "padding:", spacing, ";",
    "border-width: 0;", # force outer card to have border zero for distill
    corners[["card"]]
  )
}

outer_row_class <- function(width, spacing) {
  paste("row p-0", width) #, row_margins_class(spacing))
}

outer_row_style <- function(spacing) {
  paste0(
    "margin-left: -", spacing, "; ",
    "margin-right: -", spacing, "; ",
    "margin-top: 1rem; ",
    "margin-bottom: 1rem; "
  )
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


# images ------------------------------------------------------------------

image_link_style <- function() {
  "color: inherit;"
}

image_class <- function(layout) {
  card_type <- "card-img"
  if(layout == "label-above") card_type <- "card-img-bottom"
  if(layout == "label-below") card_type <- "card-img-top"
  paste0(card_type)
}

image_style <- function(corners, border, layout) {
  border_widths <- border[["width"]]
  if(layout == "label-above") border_widths <- border_width_style(border[["width"]], top = FALSE)
  if(layout == "label-below") border_widths <- border_width_style(border[["width"]], bottom = FALSE)
  paste0(
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border_widths, "; ",
    if(layout == "label-left") {image_margin_left(border[["width"]])},
    if(layout == "label-right") {image_margin_right(border[["width"]])},
    corners[["image"]]
  )
}

image_margin_left <- function(width) {
  paste0(
    "margin-left: ", width, ";",
    "margin-right: -", width, ";",
    "margin-top: -", width, ";",
    "margin-bottom: -", width, ";"
  )
}

image_margin_right <- function(width) {
  paste0(
    "margin-left: -", width, ";",
    "margin-right: -", width, ";",
    "margin-top: -", width, ";",
    "margin-bottom: -", width, ";"
  )
}


# vertical layouts --------------------------------------------------------

label_vertical_class <- function(padding) {
  paste0("card-body justify-content-end m-0 p-", padding)
}

label_vertical_style <- function(label_colour, corners, border) {
  paste0(
    "visibility: visible; ",
    "background-color: ", label_colour, "; ",
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border[["width"]], "; ",
    corners[["label"]]
  )
}


# horizontal layouts ------------------------------------------------------

label_horizontal_class <- function(breakpoint) {
  paste(breakpoint, "h-100")
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

body_horizontal_style <- function(label_colour, corners, border) {
  paste0(
    "visibility: visible; ",
    "border-style:", border[["style"]], "; ",
    "border-color:", border[["colour"]], "; ",
    "border-width:", border[["width"]], "; ",
    "background-color: ", label_colour, ";",
    corners[["core"]]
  )
}

image_horizontal_class <- function(breakpoint) {
  label_cols <- as.numeric(gsub("col-", "", breakpoint))
  paste0("col-", 12 - label_cols)
}

image_horizontal_style <- function(corners) {
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

label_inset_style <- function(label_colour, corners, border, breakpoint, layout) {
  height <- round(breakpoint * 100)
  paste0(
    "overflow: hidden;",
    "background-color: ", label_colour, ";",
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


# borders utility function ------------------------------------------------

border_width_style <- function(width, top = TRUE, right = TRUE, bottom = TRUE, left = TRUE) {
  border_widths <- rep("0", 4)
  border_widths[c(top, right, bottom, left)] <- width
  border_widths <- paste(border_widths, collapse = " ")
  return(border_widths)
}




