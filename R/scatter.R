
#' Generate a scatter plot
#' @description
#' `dren_scatter()` Generate an example of what is in the package
#' @importFrom ggplot2 geom_point
#' @importFrom sysfonts font_families
#' @examples
#' if (interactive()) {
#'   ggplot(mtcars, aes(x = mpg, y = wt)) +
#'     dren_scatter()
#' }
#' @return Returns an example plot which uses the package
#' @export build_example
dren_scatter <- function(
  title = 'My Scatter',
  x_title = 'MPG',
  y_title = 'WT',
  font = 'serif',
  font_size = 16
) {
  print(font_families())
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


ggplot(mtcars, aes(x = mpg, y = wt)) +
  dren_scatter(
    title = 'MPG v. WT',
    font = 'mono',
    font_size = 30
  )
