
#' Generate a plot
#' @description
#' `build_example()` Generate an example of what is in the package
#'
#' @importFrom urbnmapr get_urbn_map
#' @importFrom dplyr left_join
#' @importFrom readr read_csv
#' @importFrom ggplot2 ggplot geom_sf scale_fill_viridis_c theme_bw theme aes labs
#' @importFrom ggplot2 element_text geom_polygon ggtitle alpha map_data  element_blank
#' @importFrom ggplot2 theme_minimal coord_fixed unit
#' @importFrom ggridges geom_density_ridges_gradient
#' @importFrom viridis scale_fill_viridis
#' @importFrom rlang .data
#' @importFrom gridExtra grid.arrange
#' @examples
#' if (interactive()) {
#'     build_example()
#' }
#' @return Returns an example plot which uses the package
#' @export build_example
build_example <- function() {
  # GeoSpatial Plotting
  counties_sf <- get_urbn_map("counties", sf = TRUE)
  spatial_data <- left_join(counties_sf,
                            drenplot::statedata,
                            by = "state_name")

  gs <-
    ggplot() +
    geom_sf(spatial_data,
            mapping = aes(fill = .data$horate),
            color = "#ffffff",
            size = 0.25) +
    labs(fill = "Homeownership rate")


  # Ridge Plot
  # https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
  rideline <-
    ggplot(drenplot::lincoln_weather, aes(x = .data$`Mean Temperature [F]`, y = .data$`Month`, fill = .data$..x..)) +
    geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
    scale_fill_viridis_c(name = "Temp. [F]", option = "C") +
    labs(title = 'Temperatures in Lincoln NE in 2016') +
    theme_bw() +
    theme(
      legend.position="none",
      panel.spacing = unit(0.1, "lines"),
      strip.text.x = element_text(size = 8)
    )


  # County Plot
  unemp <- drenplot::unemployment
  names(unemp) <- c("id", "state_fips", "county_fips", "name", "year",
                    "?", "?", "?", "rate")
  unemp$county <- tolower(gsub(" County, [A-Z]{2}", "", unemp$name))
  unemp$county <- gsub("^(.*) parish, ..$","\\1", unemp$county)
  unemp$state <- gsub("^.*([A-Z]{2}).*$", "\\1", unemp$name)
  county_df <- map_data("county", projection = "albers", parameters = c(39, 45))
  names(county_df) <- c("long", "lat", "group", "order", "state_name", "county")
  county_df$state <- datasets::state.abb[match(county_df$state_name, tolower(datasets::state.name))]
  county_df$state_name <- NULL

  state_df <- map_data("state", projection = "albers", parameters = c(39, 45))

  choropleth <- merge(county_df, unemp, by = c("state", "county"))
  choropleth <- choropleth[order(choropleth$order), ]

  county_plot <-
    ggplot(choropleth, aes(.data$long, .data$lat, group = .data$group)) +
    geom_polygon(aes(fill = .data$rate), colour = alpha("white", 1 / 2), size = 0.2) +
    geom_polygon(data = state_df, colour = "white", fill = NA) +
    coord_fixed() +
    theme_minimal() +
    ggtitle("US unemployment rate by county") +
    theme(axis.line = element_blank(), axis.text = element_blank(),
          axis.ticks = element_blank(), axis.title = element_blank()) +
    scale_fill_viridis(option="magma")


  # Create the GRID
  grid.arrange(
    grobs = list(gs = gs,
                 rideline = rideline,
                 county_plot = county_plot),
    layout_matrix = rbind(c(1,1,1,1,2,2,2),
                          c(1,1,1,1,2,2,2),
                          c(3,3,3,3,2,2,2),
                          c(3,3,3,3,2,2,2))
  )
}

