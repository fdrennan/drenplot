<!-- badges: start -->
[![Travis build status](https://travis-ci.com/fdrennan/drenplot.svg?branch=master)](https://travis-ci.com/fdrennan/drenplot)
[![Codecov test coverage](https://codecov.io/gh/fdrennan/drenplot/branch/master/graph/badge.svg)](https://codecov.io/gh/fdrennan/drenplot?branch=master)
<!-- badges: end -->

```
library(drenplot)
```

```
build_example()
```

```
ggplot2::ggplot(mtcars, aes(x = mpg, y = wt)) +
 dren_scatter(
   title = 'MPG v. WT',
   font ='serif',
   font_size = 30
 )
```


```
## Libraries
library(drenplot)
library(dplyr)
library(ggplot2)
library(extrafont)
library(magrittr)
library(jcolors)
library(reticulate)
library(forcats)
library(ranger)
library(rsample)
library(purrr)
# library(gganimate)


boots <- bootstraps(moons_dataset, strata = 'label', times = 1)

models <-
  map(
  boots[[1]],
  function(x) {
    x_analysis <- analysis(x)
    x_assessment <- assessment(x)
    rf <- ranger(formula = label ~ y + x, data = x_analysis, probability = TRUE)
    list(
      analysis = x_analysis,
      assessment = x_assessment,
      model = rf
    )
  }
)
# devtools::install_github("jaredhuling/jcolors")
# conda_install(envname = 'r-reticulate', packages = 'scikit-learn')

# sklearn <- import('sklearn')
# dataset <-
#   sklearn$datasets$make_moons(n_samples = 20000L,
#                               shuffle = TRUE,
#                               noise = .25)
#
# moons_dataset <- tibble(
#   x = dataset[[1]][,1],
#   y = dataset[[1]][,2],
#   label = as_factor(dataset[[2]])
# )
# #
# font_import()
loadfonts(quiet = FALSE)

# my_colors <- c("#b48c3c","#b6803e","#b27361","#2f354c","#482c28")
my_colors <- c("#ee6352","#08b2e3","#efe9f4","#57a773","#484d6d")


text_size = 20
x_large_text = text_size*1.5
large_text = text_size*1.25
medium_text = text_size
medium_small = text_size*.75
small_text = text_size*.5

font_family <- 'Gill Sans Light'


models_list <-
  map(
  models,
  function(model) {
    model$assessment$predictions <- predict(model$model, model$assessment)$predictions[,1]
    model$assessment
  }
)

models_df <- map2_df(.x = 1:length(models_list), .y = models_list, ~ mutate(.y, list_id = .x))

p <-
  models_df %>%
  filter(list_id == 1) %>%
  mutate(label = if_else(label == '0', 'Actual 0', 'Actual 1')) %>%
  arrange(label = as_factor(label)) %>%
  ggplot() +
  geom_density_2d(
    aes(x = x,
        y = y,
        alpha = predictions)
    # alpha = predictions
  ) +
  facet_wrap(label ~ predictions < .5) +
  geom_point(
    aes(x = x, y = y, fill = predictions),
    size = 2,
    alpha = 1
  ) +
  ylab('Data About Y') +
  xlab('Data About X') +
  labs(title = 'Moons',
       col = 'Predicted Moon',
       subtitle = 'An Interesting Subtitle About Moons',
       caption = 'Built by Freddy Drennan',
       tag = 'We Did A Thing With Data!') +
  theme_minimal() +
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

p
```
