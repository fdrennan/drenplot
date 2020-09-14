
#' Generate a dataset
#'
#' @importFrom reticulate import
#' @importFrom tibble tibble
#' @importFrom forcats as_factor
#' @examples
#' if (interactive()) {
#'     make_moons()
#' }
#' @return Returns a moon datast
#' @export make_moons
make_moons <- function(n_samples = 20000L,
                       shuffle = TRUE,
                       noise = .55) {
  sklearn <- import('sklearn')
  dataset <-
    sklearn$datasets$make_moons(n_samples = n_samples,
                                shuffle = shuffle,
                                noise = noise)

  moons_dataset <- tibble(
    x = dataset[[1]][,1],
    y = dataset[[1]][,2],
    label = as_factor(dataset[[2]])
  )

  moons_dataset
}
