#' Helps cache the building of the correlation
#' matrix.
#'
#' @return A function that builds or returns the
#'         correlation matrix.
#'
#' @export
make_cached_correl_matrix <- function() {
  cache <- NULL

  function() {
    if (is.null(cache)) {
      cache <<- build_cnoid_effect_correlation()
    }

    cache
  }
}

#' Gives the cached correlation matrix.
#'
#' @return The cached correlation matrix.
#'
#' @export
get_cached_correl_matrix <- make_cached_correl_matrix()

#' Calculates the effect values for the given cnoid profile.
#'
#' @param d9    D9 value.
#' @param thcv  THCV value.
#' @param cbd   CBD value.
#' @param cbn   CBN value.
#' @param cbg   CBG value.
#' @param cbc   CBC value.
#' @return      The effect values.
#' @examples
#' regress_cnoids_to_effects(
#'   d9 = 100,
#'   thcv = 0,
#'   cbd = 0,
#'   cbn = 0,
#'   cbg = 0,
#'   cbc = 0
#' )
#'
#' @export
regress_cnoids_to_effects <- function(
    d9 = 0,
    thcv = 0,
    cbd = 0,
    cbn = 0,
    cbg = 0,
    cbc = 0) {
  correl_matrix <- get_cached_correl_matrix()

  values <- c()
  for (i in 1:n_effects) {
    effect_values <- unname(unlist(correl_matrix[, i]))
    x_product <-
      effect_values * c(
        d9,
        thcv,
        cbd,
        cbn,
        cbg,
        cbc
      )
    correl_value <- sum(x_product)
    values <- c(values, correl_value)
  }

  values
}

#' Calculates the cnoid values for the given effect profile.
#'
#' @param aroused     Aroused value.
#' @param hungry      Hungry value.
#' @param energetic   Energetic value.
#' @param happy       Happy value.
#' @param creative    Creative value.
#' @param giggly      Giggly value.
#' @param uplifted    Uplifted value.
#' @param focused     Focused value.
#' @param talkative   Talkative value.
#' @param relaxed     Relaxed value.
#' @param tingly      Tingly value.
#' @param euphoric    Euphoric value.
#' @param sleepy      Sleepy value.
#' @return            The cnoid values.
#' @examples
#' regress_effects_to_cnoids(
#'   aroused = 100,
#'   hungry = 0,
#'   energetic = 0,
#'   happy = 0,
#'   creative = 0,
#'   giggly = 0,
#'   uplifted = 0,
#'   focused = 0,
#'   talkative = 0,
#'   relaxed = 0,
#'   tingly = 0,
#'   euphoric = 0,
#'   sleepy = 0
#' )
#'
#' @export
regress_effects_to_cnoids <- function(
    aroused = 0,
    hungry = 0,
    energetic = 0,
    happy = 0,
    creative = 0,
    giggly = 0,
    uplifted = 0,
    focused = 0,
    talkative = 0,
    relaxed = 0,
    tingly = 0,
    euphoric = 0,
    sleepy = 0) {
  correl_matrix <- get_cached_correl_matrix()

  values <- c()
  for (i in 1:n_cnoids) {
    effect_values <- unname(unlist(correl_matrix[i, ]))
    x_product <-
      effect_values * c(
        aroused,
        hungry,
        energetic,
        happy,
        creative,
        giggly,
        uplifted,
        focused,
        talkative,
        relaxed,
        tingly,
        euphoric,
        sleepy
      )
    correl_value <- sum(x_product)
    values <- c(values, correl_value)
  }

  values
}
