#' Simple linear interpolation between two values.
#'
#' @param start     The initial value.
#' @param end       The final value.
#' @param fraction  A fractional value between 0 and 1.
#' @return          The interpolated value.
#' @examples
#' lerp(0, 100, 0.5)
#'
#' @export
lerp <- function(start, end, fraction) {
  (end - start) * fraction + start
}

#' Normalize a list of data by dividing by it's
#' absolute max value.
#'
#' @param values    The list of values.
#' @return          The normalized list.
#' @examples
#' normalize(c(0.9, 0.2, 0.3, 0.4, 0.1, 0.5))
#'
#' @export
normalize <- function(values) {
  vals <- unlist(values)
  max_abs <- max(abs(vals))

  # Avoid division by zero
  if (max_abs == 0) {
    return(vals)
  }

  vals / max_abs
}

#' Normalize a list of data by min-max method.
#'
#' @param values    The list of values.
#' @param main      The minimum value.
#' @param max       The maximum value.
#' @return          The normalized list.
#' @examples
#' normalize_min_max(
#'   c(0.9, 0.2, 0.3, 0.4, 0.1, 0.5),
#'   0,
#'   1
#' )
#'
#' @export
normalize_min_max <- function(values, min, max) {
  vals <- unlist(values)
  max_abs <- max(abs(vals))

  # Avoid division by zero
  if (max_abs == 0) {
    return(vals)
  }

  # Normalize to [-1, 1]
  norm <- vals / max_abs
  if (identical(min, -1) && identical(max, 1)) {
    return(norm)
  }

  # Linearly map from [-1, 1] -> [target_min, target_max]
  scaled <- ((norm + 1) / 2) * (max - min) + min

  scaled
}
