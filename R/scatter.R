
#' Generate a scatter plot
#' @description
#' `dren_scatter()` Generate an example of what is in the package
#' @importFrom ggplot2 geom_point xlab ylab geom_smooth
#' @importFrom sysfonts font_families
#' @importFrom purrr walk
#' @importFrom glue glue
#' @param title The main title for the plot
#' @param x_title The main label for X axis
#' @param y_title The main label for Y axis
#' @param font The preferred font
#' @param font_size The font size
#' @param point_size The point size
#' @param add_lm Add a best fit line
#' @param lm_colour Color of regression line
#' @param lm_size Size of regression line
#' @examples
#' if (interactive()) {
#'   ggplot(mtcars, aes(x = mpg, y = wt)) +
#'     dren_scatter()
#' }
#' @return Returns an example plot which uses the package
#' @export dren_scatter
dren_scatter <- function(
  title = 'My Scatter',
  x_title = 'MPG',
  y_title = 'WT',
  font = 'serif',
  font_size = 16,
  point_size = 1,
  add_lm = TRUE,
  lm_colour = 'black',
  lm_size = 2
) {
  message('Fonts to try')
  walk(font_families(), function(font) {
    message(glue("font ='{font}'\n"))
  })

  response <-
    list(geom_point(size = point_size),
       ggtitle(title),
       xlab(x_title),
       ylab(y_title),
       theme_minimal(),
       theme(
         text = element_text(
           size=font_size,
           family=font
         )
       ))

  if(add_lm) {
    response <-
      list(
        response,
        geom_smooth(
          method = 'lm',
          se = FALSE,
          colour = lm_colour,
          size = lm_size)
      )
  }

  response
}



