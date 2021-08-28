test_that("is_scalar_numeric works", {
  expect_true(is_scalar_numeric(1.35))
  expect_true(is_scalar_numeric(1L))
  expect_false(is_scalar_numeric("1"))
  expect_false(is_scalar_numeric(NA_character_))
  expect_false(is_scalar_numeric(TRUE))
  expect_false(is_scalar_numeric(1:3))
})
