#'  Generate the main theme
#' @description
#' `dren_theme()` Generate the main theme
#' @examples
#' if (interactive()) {
#'     mtcars %>%
#'      ggplot(aes(x = mpg, y = wt)) +
#'      geom_point() +
#'      dren_theme()
#' }
#' @importFrom  ggplot2 theme_minimal element_text element_rect margin element_line
#' @export dren_theme
dren_theme <- function() {
  font_family <- "Gill Sans Light"
  my_colors <- c("#ee6352","#08b2e3","#efe9f4","#57a773","#484d6d")

  my_colors[1] = 'black'
  my_colors[3] = 'white'

  text_size = 20
  x_large_text = text_size*1.5
  large_text = text_size*1.25
  medium_text = text_size
  medium_small = text_size*.75
  small_text = text_size*.6

  font_family <- 'Gill Sans Light'

  list(
    theme_minimal(),
    theme(
      text = element_text(
        family=font_family,
        size=medium_text,
        colour = my_colors[1],
      ),
      plot.title = element_text(size=x_large_text, face="bold", color = my_colors[1]),
      plot.subtitle = element_text(size=large_text, face="bold", color = my_colors[1]),
      plot.background = element_rect(fill = my_colors[3]),
      plot.tag.position = 'top',
      plot.margin = unit(c(0.1,0.1,0.1,0.1), "cm"),
      legend.position	= 'bottom',
      legend.direction = 'horizontal',
      axis.title = element_text(size=large_text,face="bold", color = my_colors[1]),
      axis.text = element_text(size=medium_text, face="bold", color = my_colors[1]),
      legend.title = element_text(
        size=large_text, face="bold", color = my_colors[1]
      ),
      legend.text = element_text(
        size=small_text, face="bold", color = my_colors[1]
      ),
      legend.background = element_rect(
        fill =  my_colors[3],
        colour = my_colors[3],
        size = 0.5,
        linetype = "solid"
      ),
      legend.key = element_rect(
        fill =  my_colors[3],
        colour = my_colors[3],
        size = 0.5,
        linetype = "solid"
      ),
      panel.background = element_rect(
        fill =  my_colors[3],
        colour =  my_colors[3],
        size = 0.1,
        linetype = "solid"
      ),
      panel.grid.major = element_line(
        size = .4,
        linetype = 'solid',
        colour = my_colors[5]
      ),
      panel.grid.minor = element_line(
        size = .2,
        linetype = 'solid',
        colour = my_colors[5]
      ),
      legend.margin =  margin(0, 0, 0, 0, "cm")
    )
  )
}

