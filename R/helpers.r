#' Generate a radar animation of the effects between two cnoid
#' profiles.
#'
#' The values should sum to 100.
#'
#' @param frames        The number of frames to animate (60fps).
#' @param start_values  The starting cnoid values.
#' @param end_values    The ending cnoid values.
#' @return              The graph animation.
#' @examples
#' anim_effects(
#'   120,
#'   c(100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
#'   c(50, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0)
#' )
#'
#' @export
anim_effects <- function(frames, start_values, end_values) {
  radar_anim(
    frames,
    start_values,
    end_values,
    categories_effects,
    true_bounds_effects()
  )
}

#' Generate a radar of the effects profile.
#'
#' The values should sum to 100.
#'
#' @param values        The starting cnoid values.
#' @return              The graph.
#' @examples
#' graph_effects(
#'   c(100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
#' )
#'
#' @export
graph_effects <- function(values) {
  radar(
    values,
    categories_effects,
    true_bounds_effects()
  )
}

#' Generate a radar animation of the cnoids
#' between two effect profiles.
#'
#' The values should sum to 100.
#'
#' @details
#' We normalize the values here because otherwise
#' it is too challenging to see the impact of
#' changes. However, we lose the intensity of the
#' cnoid profile effects as a consequence.
#'
#' @param frames        The number of frames to animate (60fps).
#' @param start_values  The starting effect values.
#' @param end_values    The ending effect values.
#' @return              The graph animation.
#' @examples
#' anim_cnoids(
#'   120,
#'   c(100, 0, 0, 0, 0, 0),
#'   c(80, 5, 5, 5, 5, 0)
#' )
#'
#' @export
anim_cnoids <- function(frames, start_values, end_values) {
  norm_start_values <- normalize(start_values)
  norm_end_values <- normalize(end_values)

  radar_anim(
    frames,
    norm_start_values,
    norm_end_values,
    categories_cnoids,
    c(-1, 1)
  )
}

#' Generate a radar of the cnoids profile.
#'
#' The values should sum to 100.
#'
#' @details
#' We normalize the values here because otherwise
#' it is too challenging to see the impact of
#' changes. However, we lose the intensity of the
#' cnoid profile effects as a consequence.
#'
#' @param values        The starting cnoid values.
#' @return              The graph.
#' @examples
#' graph_cnoids(
#'   c(100, 0, 0, 0, 0, 0)
#' )
#'
#' @export
graph_cnoids <- function(values) {
  norm_values <- normalize(values)

  radar(
    norm_values,
    categories_cnoids,
    c(-1, 1)
  )
}
