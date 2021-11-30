test_that("length errors on card parts are caught", {

  # bad
  expect_error(cards(galleries, image = image_url, title = c("wrong", "length")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, image = image_url, text = c("wrong", "length")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, title = image_url, image = c("wrong", "length")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, image = image_url, text = blurb, link = c("wrong", "length")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, image = image_url, text = blurb, footer = c("wrong", "length")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, image = image_url, text = blurb, header = c("wrong", "length")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, image = image_url, text = blurb, tags = c("wrong", "length")), "length 1 or equal to the number of cards")

  # good
  expect_s3_class(cards(galleries, image = image_url, title = "length_one"),"shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = "length_one"), "shiny.tag")
  expect_s3_class(cards(galleries, title = image_url, image = "length_one"), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, link = "length_one"), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, footer = "length_one"), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, header = "length_one"), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, tags = "length_one"), "shiny.tag")

  # good
  length_seven <- rep("blah", nrow(galleries))
  expect_s3_class(cards(galleries, image = image_url, title = length_seven),"shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = length_seven), "shiny.tag")
  expect_s3_class(cards(galleries, title = image_url, image = length_seven), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, link = length_seven), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, footer = length_seven), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, header = length_seven), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, text = blurb, tags = length_seven), "shiny.tag")

})


test_that("layout argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, layout = c("label-left", "label-top")), "unrecognised value for layout")
  expect_error(cards(galleries, title = "title", image = image_url, layout = 1), "unrecognised value for layout")
  expect_error(cards(galleries, title = "title", image = image_url, layout = NA_character_), "unrecognised value for layout")
  expect_error(cards(galleries, title = "title", image = image_url, layout = list("label-left")), "unrecognised value for layout")

  twin_layouts <- c("label-left", "label-right", "label-above", "label-below", "inset-top", "inset-bottom")
  for(l in twin_layouts) {
    expect_s3_class(cards(galleries, title = "title", image = image_url, layout = l), "shiny.tag")
  }
  expect_s3_class(cards(galleries, title = "title", layout = "label-only"), "shiny.tag")
  expect_s3_class(cards(galleries, image = image_url, layout = "image-only"), "shiny.tag")


})


test_that("width argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, width = rep(3, 7)), "width must be an integer between 1 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, width = NA_integer_), "width must be an integer between 1 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, width = 1.3), "width must be an integer between 1 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, width = 10), "width must be an integer between 1 and 5")

  for(w in 1:5) {
    expect_s3_class(cards(galleries, title = "title", image = image_url, width = w), "shiny.tag")
  }

  # note: deliberately not checking character input

})

test_that("spacing argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, spacing = rep(3, 7)), "spacing must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, spacing = NA_integer_), "spacing must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, spacing = 1.3), "spacing must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, spacing = 10), "spacing must be an integer between 0 and 5")

  # note: deliberately not checking character input

  for(s in 0:5) {
    expect_s3_class(cards(galleries, title = "title", image = image_url, spacing = s), "shiny.tag")
  }

})


test_that("breakpoint argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, breakpoint = rep(3, 7)), "breakpoint must be an integer between 1 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, breakpoint = NA_integer_), "breakpoint must be an integer between 1 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, breakpoint = 1.3), "breakpoint must be an integer between 1 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, breakpoint = 10), "breakpoint must be an integer between 1 and 5")

  # note: deliberately not checking character input

  for(b in 1:5) {
    expect_s3_class(cards(galleries, title = "title", image = image_url, layout = "label-left",  breakpoint = b), "shiny.tag")
    expect_s3_class(cards(galleries, title = "title", image = image_url, layout = "inset-top",  breakpoint = b), "shiny.tag")
  }

})


test_that("border_width argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, border_width = rep(3, 7)), "border_width must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, border_width = NA_integer_), "border_width must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, border_width = 1.3), "border_width must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, border_width = 10), "border_width must be an integer between 0 and 5")

  # note: deliberately not checking character input

  for(b in 0:5) {
    expect_s3_class(cards(galleries, title = "title", image = image_url, border_width = b), "shiny.tag")
  }

})

test_that("border_radius argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, border_radius = rep(3, 7)), "border_radius must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, border_radius = NA_integer_), "border_radius must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, border_radius = 1.3), "border_radius must be an integer between 0 and 5")
  expect_error(cards(galleries, title = "title", image = image_url, border_radius = 10), "border_radius must be an integer between 0 and 5")

  # note: deliberately not checking character input

  for(r in 0:5) {
    expect_s3_class(cards(galleries, title = "title", image = image_url, border_radius = r), "shiny.tag")
  }

})


test_that("border_colour argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, border_colour = c("red", "red")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, title = "title", image = image_url, border_colour = 10), "must be character")

  expect_error(cards(galleries, title = "title", image = image_url, border_colour = "not a colour"), "invalid RGB specification")
  expect_s3_class(cards(galleries, title = "title", image = image_url, border_colour = "red"), "shiny.tag")
  expect_s3_class(cards(galleries, title = "title", image = image_url, border_colour = "#aaabbb"), "shiny.tag")
  expect_s3_class(cards(galleries, title = "title", image = image_url, border_colour = "#aaabbbcc"), "shiny.tag")

  # note: deliberately not checking character input

})

test_that("label_colour argument errors are caught", {

  expect_error(cards(galleries, title = "title", image = image_url, label_colour = c("red", "red")), "length 1 or equal to the number of cards")
  expect_error(cards(galleries, title = "title", image = image_url, label_colour = 10), "must be character")

  expect_error(cards(galleries, title = "title", image = image_url, label_colour = "not a colour"), "invalid RGB specification")
  expect_s3_class(cards(galleries, title = "title", image = image_url, label_colour = "red"), "shiny.tag")
  expect_s3_class(cards(galleries, title = "title", image = image_url, label_colour = "#aaabbb"), "shiny.tag")
  expect_s3_class(cards(galleries, title = "title", image = image_url, label_colour = "#aaabbbcc"), "shiny.tag")

  # note: deliberately not checking character input

})

test_that("factor tags are handled correctly", {

  galleries_fct <- galleries
  galleries_fct$paintbrushes <- as.factor(galleries_fct$paintbrushes)

  expect_equal(
    cards(galleries, title = long_name, tags = paintbrushes),
    cards(galleries_fct, title = long_name, tags = paintbrushes)
  )

})

test_that("cards() uses data columns by default", {

  galleries_rnm <- galleries
  galleries_rnm$title <- galleries_rnm$long_name
  galleries_rnm$image <- galleries_rnm$image_url
  galleries_rnm$long_name <- NULL
  galleries_rnm$image_url <- NULL

  expect_equal(
    cards(galleries, title = long_name, image = image_url),
    cards(galleries_rnm)
  )

})


