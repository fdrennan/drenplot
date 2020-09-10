context("example_plot")
library(testthat)
library(drenplot)

test_that("example_plot returns a plot", function() {
  expect_equal(
    inherits(build_example()),
    c("gtable", "gTree", "grob", "gDesc")
  )
})
