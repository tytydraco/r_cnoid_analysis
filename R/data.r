#' Hemp strains with cnoid profile and effects profile.
#'
#' @details The cnoid profile should be
#' percentages ranging from 0 to 100. The data
#' came from https://flowercompany.com/, and the
#' strain effect data came from scraped data from
#' the internal https://leafly.com/ API.
#'
#' Additional tools for scraping:
#' - https://github.com/tytydraco/ll
#'   Graphical tool to analyze internal Leafly API
#'   data.
#' - https://github.com/tytydraco/leafly-strain-scraper/
#'   Command line tool to scrape the Leafly API
#'   into a JSON document.
#'
all_strains <- list(
  list(
    name = "Blue Dream",
    cnoids = c(
      d9 = 91.8,
      thcv = 0.2817,
      cbd = 0.1292,
      cbn = 0.3293,
      cbg = 3.018,
      cbc = 0.8283
    ),
    effects = c(
      aroused = 1.14,
      hungry = 1.04,
      energetic = 1.02,
      happy = 1.87,
      creative = 1.97,
      giggly = 1.34,
      uplifted = 1.87,
      focused = 1.49,
      talkative = 1.26,
      relaxed = 1.7,
      tingly = 1.06,
      euphoric = 1.92,
      sleepy = 0.13
    )
  ),
  list(
    name = "Gelato",
    cnoids = c(
      d9 = 93.0392,
      thcv = 0.2603,
      cbd = 0,
      cbn = 0.3712,
      cbg = 3.0198,
      cbc = 0.9028
    ),
    effects = c(
      aroused = 2.47,
      hungry = 1.19,
      energetic = -0.19,
      happy = 1.89,
      creative = 1.16,
      giggly = 1.24,
      uplifted = 1.4,
      focused = 1.05,
      talkative = 0.79,
      relaxed = 2.74,
      tingly = 1.7,
      euphoric = 2.13,
      sleepy = 0.57
    )
  ),
  list(
    name = "Sour Diesel",
    cnoids = c(
      d9 = 93.1031,
      thcv = 0.5004,
      cbd = 0.1691,
      cbn = 0.9178,
      cbg = 3.0788,
      cbc = 0.8233
    ),
    effects = c(
      aroused = 1.19,
      hungry = 0.93,
      energetic = 1.87,
      happy = 1.43,
      creative = 1.52,
      giggly = 1.22,
      uplifted = 1.57,
      focused = 1.4,
      talkative = 1.59,
      relaxed = 0.48,
      tingly = 0.94,
      euphoric = 1.29,
      sleepy = -0.37
    )
  ),
  list(
    name = "Sour Tangie",
    cnoids = c(
      d9 = 92.596,
      thcv = 0.912,
      cbd = 0.14,
      cbn = 0.45,
      cbg = 2.665,
      cbc = 1.846
    ),
    effects = c(
      aroused = 0.57,
      hungry = 0.07,
      energetic = 1.37,
      happy = 0.96,
      creative = 0.97,
      giggly = 0.71,
      uplifted = 1.22,
      focused = 1.35,
      talkative = 0.91,
      relaxed = 0.39,
      tingly = 0.75,
      euphoric = 0.68,
      sleepy = -0.5
    )
  ),
  list(
    name = "Premium Jack",
    cnoids = c(
      d9 = 90.107,
      thcv = 0,
      cbd = 0,
      cbn = 0.23,
      cbg = 1.709,
      cbc = 0.463
    ),
    effects = c(
      aroused = 0.73,
      hungry = 0.39,
      energetic = 2.49,
      happy = 1.66,
      creative = 2.25,
      giggly = 0.73,
      uplifted = 2.04,
      focused = 2.56,
      talkative = 1.67,
      relaxed = 0.39,
      tingly = 0.62,
      euphoric = 1.41,
      sleepy = -0.73
    )
  ),
  list(
    name = "Strawberry Cough",
    cnoids = c(
      d9 = 90.8552,
      thcv = 0.3891,
      cbd = 0.2317,
      cbn = 1.0327,
      cbg = 2.5748,
      cbc = 0.7104
    ),
    effects = c(
      aroused = 0.79,
      hungry = 0.45,
      energetic = 1.43,
      happy = 1.39,
      creative = 0.99,
      giggly = 1.15,
      uplifted = 1.62,
      focused = 1.25,
      talkative = 1.26,
      relaxed = 0.72,
      tingly = 0.8,
      euphoric = 1.17,
      sleepy = -0.46
    )
  ),
  list(
    name = "OG Kush",
    cnoids = c(
      d9 = 91.352,
      thcv = 0.6961,
      cbd = 0.2153,
      cbn = 0.3549,
      cbg = 3.2606,
      cbc = 0.7182
    ),
    effects = c(
      aroused = 0.76,
      hungry = 1.82,
      energetic = -0.17,
      happy = 1.36,
      creative = 0.49,
      giggly = 1.09,
      uplifted = 0.78,
      focused = 0.59,
      talkative = 0.67,
      relaxed = 1.61,
      tingly = 1.15,
      euphoric = 1.4,
      sleepy = 1.49
    )
  ),
  list(
    name = "Blue Burst",
    cnoids = c(
      d9 = 91.2943,
      thcv = 0.4214,
      cbd = 0,
      cbn = 0.4387,
      cbg = 2.7885,
      cbc = 0.8972
    ),
    effects = c(
      aroused = 1.21,
      hungry = 0.39,
      energetic = 0.21,
      happy = 0.91,
      creative = 0.67,
      giggly = 0.51,
      uplifted = 0.87,
      focused = 1.4,
      talkative = 0.24,
      relaxed = 0.95,
      tingly = 0.44,
      euphoric = 1.06,
      sleepy = 0.13
    )
  ),
  list(
    name = "Limoncello",
    cnoids = c(
      d9 = 90.6878,
      thcv = 0,
      cbd = 0,
      cbn = 0.3279,
      cbg = 2.2561,
      cbc = 0.2011
    ),
    effects = c(
      aroused = 0.2,
      hungry = 0.14,
      energetic = 0.3,
      happy = 0.85,
      creative = 0.41,
      giggly = 1.04,
      uplifted = 0.27,
      focused = 0.59,
      talkative = 0.82,
      relaxed = 0.8,
      tingly = 0.63,
      euphoric = 0.7,
      sleepy = 0.16
    )
  ),
  list(
    name = "Apple Fritter",
    cnoids = c(
      d9 = 91.6528,
      thcv = 0.7754,
      cbd = 0.1547,
      cbn = 0.5262,
      cbg = 3.8654,
      cbc = 0.6629
    ),
    effects = c(
      aroused = 0,
      hungry = 0.03,
      energetic = -0.18,
      happy = 0.2,
      creative = 0.02,
      giggly = 0.42,
      uplifted = 0.05,
      focused = 0.04,
      talkative = 0.01,
      relaxed = 0.62,
      tingly = 0.66,
      euphoric = 0.22,
      sleepy = 0.11
    )
  ),
  list(
    name = "Orange Sunset",
    cnoids = c(
      d9 = 87.836,
      thcv = 0.478,
      cbd = 0.172,
      cbn = 0.478,
      cbg = 2.125,
      cbc = 1.379
    ),
    effects = c(
      aroused = -0.04,
      hungry = 0.24,
      energetic = 0.88,
      happy = 0.64,
      creative = 0.64,
      giggly = 0.53,
      uplifted = 1.09,
      focused = 1.04,
      talkative = 0.75,
      relaxed = 0.33,
      tingly = 0.19,
      euphoric = 0.49,
      sleepy = -0.28
    )
  ),
  list(
    name = "Pineapple Express",
    cnoids = c(
      d9 = 92.4848,
      thcv = 0.5807,
      cbd = 0.2701,
      cbn = 0.3457,
      cbg = 2.7134,
      cbc = 0.2194
    ),
    effects = c(
      aroused = 0.87,
      hungry = 0.7,
      energetic = 1.52,
      happy = 1.57,
      creative = 1.3,
      giggly = 1.54,
      uplifted = 1.42,
      focused = 1.02,
      talkative = 1.45,
      relaxed = 0.77,
      tingly = 0.94,
      euphoric = 1.13,
      sleepy = -0.43
    )
  )
)

#' The total number of cnoids in [all_strains].
#'
#' @export
n_cnoids <- length(unname(unlist(all_strains[[1]]$cnoids)))

#' The total number of effects in [all_strains].
#'
#' @export
n_effects <- length(unname(unlist(all_strains[[1]]$effects)))

#' Produce a matrix from the data in [all_strains].
#'
#' @return The matrix of all strains and effects.
#' @export
build_all_strains_matrix <- function() {
  n_strains <- length(all_strains)

  cnoid_names <- names(all_strains[[1]]$cnoids)
  effect_names <- names(all_strains[[1]]$effects)

  # Combine names for columns.
  col_names <- c(cnoid_names, effect_names)

  all_vals <- unlist(
    lapply(all_strains, function(st) c(st$cnoids, st$effects)),
    use.names = FALSE
  )

  mat <- matrix(
    all_vals,
    nrow = n_strains,
    ncol = length(col_names),
    byrow = TRUE,
    dimnames = list(
      sapply(all_strains, `[[`, "name"), # Row names = strain names
      col_names
    )
  )

  mat
}

#' Compute the correlation matrix for all strains.
#'
#' @return The matrix for the correlations between cnoids
#'         and effects.
#' @export
build_cnoid_effect_correlation <- function() {
  strains_matrix <- build_all_strains_matrix()

  # Split all strains matrix into just cnoids and effects matricies.
  cnoid_mat <- strains_matrix[, 1:n_cnoids]
  effect_mat <- strains_matrix[, (n_cnoids + 1):(n_cnoids + n_effects)]

  # Pre-allocate matrix with NA values.
  correl_matrix <- matrix(
    NA_real_,
    nrow = n_cnoids,
    ncol = n_effects,
    dimnames = list(
      names(all_strains[[1]]$cnoids),
      names(all_strains[[1]]$effects)
    )
  )

  # Compute each correlation.
  for (i in seq_len(n_cnoids)) {
    for (j in seq_len(n_effects)) {
      correl_matrix[i, j] <- cor(
        cnoid_mat[, i],
        effect_mat[, j],
        method = "pearson"
      )
    }
  }

  correl_matrix
}

build_cnoid_effect_correlation()
