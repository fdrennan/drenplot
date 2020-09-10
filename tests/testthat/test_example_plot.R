library(testthat)
library(drenplot)

test_that("example_plot returns a plot",
          expect_equal(
            class(build_example()),
            c("gtable", "gTree", "grob", "gDesc")
          ))
