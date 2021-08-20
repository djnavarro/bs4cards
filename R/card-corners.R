


# helpers to define tidy corners ------------------------------------------


card_corners <- function(layout, footer = NULL, header = NULL, radius) {

  no_footer <- is.null(footer)
  no_header <- is.null(header)

  css_corners <- css_corner_function(radius)

  # vertical layouts

  if(layout == "label-below") {
    body_corners <- c(
      image = css_corners(tl = no_header, tr = no_header),  # image: rounded top, only if no header
      label = css_corners(bl = no_footer, br = no_footer)   # label: rounded bottom, only if no footer
    )
  }

  if(layout == "label-above") {
    body_corners <- c(
      image = css_corners(bl = no_footer,  br = no_footer),
      label = css_corners(tl = no_header,  tr = no_header)
    )
  }

  # horizontal layouts

  if(layout == "label-left") {
    body_corners <- c(
      image = css_corners(tr = no_header, br = no_footer),
      label = css_corners(tl = no_header, bl = no_footer)
    )
  }

  if(layout == "label-right") {
    body_corners <- c(
      image = css_corners(tl = no_header, bl = no_footer),
      label = css_corners(tr = no_header, br = no_footer)
    )
  }

  # inset layouts

  if(layout == "inset-top") {
    body_corners <- c(
      image = css_corners(tl = no_header, tr = no_header, bl = no_footer, br = no_footer),
      label = css_corners(tl = no_header, tr = no_header)
    )
  }

  if(layout == "inset-bottom") {
    body_corners <- c(
      image = css_corners(tl = no_header, tr = no_header, bl = no_footer, br = no_footer),
      label = css_corners(bl = no_footer, br = no_footer)
    )
  }


  # header/footers are easy: if they're absent the css is irrelevant
  # card is easy: everything is on
  corners <- c(body_corners,
    footer = css_corners(bl = TRUE, br = TRUE),
    header = css_corners(tl = TRUE, tr = TRUE),
    card = css_corners(tl = TRUE, tr = TRUE, bl = TRUE, br = TRUE),
    core = css_corners(tl = no_header, tr = no_header, bl = no_footer, br = no_footer)
  )
  return(corners)

}

css_corner_function <- function(radius) {
  function(tl = FALSE, tr = FALSE, bl = FALSE, br = FALSE, size = radius) {
    cnr <- function(exists, sz) ifelse(exists, sz, "0")
    paste(
      "border-radius:", # border-radius is clockwise from top-left
      cnr(tl, size),
      cnr(tr, size),
      cnr(br, size),
      cnr(bl, size),
      ";"
    )
  }
}


