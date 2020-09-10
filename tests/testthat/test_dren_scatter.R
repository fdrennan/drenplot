library(drenplot)

the_plot <-
  ggplot2::ggplot(mtcars, aes(x = mpg, y = wt)) +
  dren_scatter(
    title = 'MPG v. WT',
    font ='serif',
    font_size = 30
  )

test_that("example_plot returns a plot",
          expect_equal(
            class(the_plot),
            c("gg", "ggplot")
          ))
