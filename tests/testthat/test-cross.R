context("cross")

test_that("long format corresponds to expand.grid output", {
  x <- data.frame(a = 1:3, b = 4:9)

  out1 <- cross_n(x)
  out2 <- expand.grid(x, KEEP.OUT.ATTRS = FALSE) %>%
    dplyr::as_data_frame()

  expect_equal(out1, out2)
})

test_that("filtering works", {
  filter <- function(x, y) x >= y
  out <- cross(1:3, 1:3, .filter = filter)
  expect_equal(out, list(list(1, 2), list(1, 3), list(2, 3)))
})
