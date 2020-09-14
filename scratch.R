## Libraries
library(drenplot)
library(magrittr)
library(dplyr)
library(ggplot2)
library(forcats)

font_import(prompt = FALSE)
loadfonts(quiet = FALSE)



p <-
  random_moons %>%
  filter(list_id == 1) %>%
  mutate(label = if_else(label == '0', 'Actual 0', 'Actual 1')) %>%
  arrange(label = as_factor(label)) %>%
  ggplot() +
  # geom_density_2d(
  #   aes(x = x,
  #       y = y,
  #       alpha = predictions)
  #   # alpha = predictions
  # ) +
  facet_wrap(label ~ predictions < .5) +
  geom_point(
    aes(x = x, y = y, colour = label),
    size = 2,
    alpha = .6
  ) +
  # scale_shape_manual(values=c(3, 10))+
  ylab('Data About Y') +
  xlab('Data About X') +
  labs(title = 'Moons',
       col = 'Predicted Moon',
       subtitle = 'An Interesting Subtitle About Moons',
       caption = 'Built by Freddy Drennan',
       tag = 'We Did A Thing With Data!') +
  dren_theme()

p
