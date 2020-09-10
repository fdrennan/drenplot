
#' Generate a scatter plot
#' @description
#' `dren_scatter()` Generate an example of what is in the package
#' @importFrom ggplot2 geom_point xlab ylab
#' @importFrom sysfonts font_families
#' @param title The main title for the plot
#' @param x_title The main label for X axis
#' @param y_title The main label for Y axis
#' @param font The preferred font
#' @param font_size The font size
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
  font_size = 16
) {
  message('Fonts to try')
  walk(font_families(), function(font) {
    message(glue("font ='{font}'\n"))
  })
  list(geom_point(),
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

}



