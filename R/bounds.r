source("R/regression.r")

#' Finds the true bounds for use with graphs
#' for the cnoids.
#'
#' @return The min and max possible values that can
#' be generated from `generate_values()` for the
#' cnoids.
#'
#' @export
true_bounds_cnoids <- function() {
  all_values <- c(
    regress_cnoids_to_effects(100, 0, 0, 0, 0, 0),
    regress_cnoids_to_effects(0, 100, 0, 0, 0, 0),
    regress_cnoids_to_effects(0, 0, 100, 0, 0, 0),
    regress_cnoids_to_effects(0, 0, 0, 100, 0, 0),
    regress_cnoids_to_effects(0, 0, 0, 0, 100, 0),
    regress_cnoids_to_effects(0, 0, 0, 0, 0, 100)
  )

  c(
    min(all_values),
    max(all_values)
  )
}

#' Finds the true bounds for use with graphs
#' for the effects
#'
#' @return The min and max possible values that can
#' be generated from `generate_values()` for the
#' effects.
#'
#' @export
true_bounds_effects <- function() {
  all_values <- c(
    regress_effects_to_cnoids(100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0),
    regress_effects_to_cnoids(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100)
  )

  c(
    min(all_values),
    max(all_values)
  )
}
