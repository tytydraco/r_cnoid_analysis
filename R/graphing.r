#' Generates a radar graph.
#'
#' @param values      The y-coordinates.
#' @param categories  The x-coordinates.
#' @param bounds      A collection of the min and max bound.
#' @return            The radar graph.
#' @examples
#' radar(
#'   c(100, 0, 0, 0),
#'   c("A", "B", "C", "D"),
#'   c(0, 100)
#' )
#'
#' @export
#' @import plotly
radar <- function(values, categories, bounds) {
  # Repeat the first value to close the loop
  values <- c(values, values[1])
  categories <- c(categories, categories[1])

  # Mirror to match Google Sheets
  values <- rev(values)
  categories <- rev(categories)

  fig <- plotly::plot_ly(
    line = list(shape = "spline"),
    type = "scatterpolar",
    mode = "lines+markers",
    r = values,
    theta = categories,
    fill = "toself",
  )

  fig <- plotly::layout(
    fig,
    polar = list(
      angularaxis = list(
        rotation = 90,
        direction = "counterclockwise"
      ),
      radialaxis = list(
        visible = TRUE,
        range = bounds
      )
    ),
    showlegend = FALSE
  )

  fig
}

#' Generates a radar graph animation between two values.
#'
#' @param frames        The number of frames to animate (60fps).
#' @param start_values  The starting y-coordinates.
#' @param end_values    The ending y-coordinates.
#' @param categories    The x-coordinates.
#' @param bounds        A collection of the min and max bound.
#' @return              The radar graph animation.
#' @examples
#' radar_anim(
#'   120,
#'   c(100, 0, 0, 0),
#'   c(25, 25, 25, 25),
#'   c("A", "B", "C", "D"),
#'   c(0, 100)
#' )
#'
#' @export
#' @import plotly
radar_anim <- function(
    frames,
    start_values,
    end_values,
    categories,
    bounds) {
  if (length(start_values) != length(end_values)) {
    stop("start_values and end_values must have the same length")
  }

  theta <- rev(c(categories, categories[1]))
  all_r <- numeric()
  all_theta <- character()
  all_frame <- integer()

  for (f in seq_len(frames)) {
    frac <- if (frames == 1) 1 else (f - 1) / (frames - 1)

    vals <- c()
    for (i in seq_along(start_values)) {
      start_value <- start_values[i]
      end_value <- end_values[i]
      value <- lerp(start_value, end_value, frac)

      vals <- c(vals, value)
    }

    vals <- c(vals, vals[1]) # close the radial loop
    vals <- rev(vals) # mirror values to match reversed theta

    all_r <- c(all_r, vals)
    all_theta <- c(all_theta, theta)
    all_frame <- c(all_frame, rep(f, length(theta)))
  }

  df <- data.frame(
    frame = all_frame,
    theta = all_theta,
    r = all_r,
    stringsAsFactors = FALSE
  )

  df$frame <- factor(df$frame, levels = unique(df$frame))
  df$theta <- factor(df$theta, levels = unique(theta))

  fig <- plotly::plot_ly(
    data = df,
    type = "scatterpolar",
    mode = "lines+markers",
    r = ~r,
    theta = ~theta,
    frame = ~frame,
    fill = "toself",
    line = list(shape = "spline")
  )

  fig <- plotly::layout(
    fig,
    polar = list(
      angularaxis = list(
        rotation = 90,
        direction = "counterclockwise"
      ),
      radialaxis = list(
        visible = TRUE,
        range = bounds
      )
    ),
    showlegend = FALSE
  )

  fig <- plotly::animation_opts(
    fig,
    frame = 16.666666667,
    transition = 0,
    redraw = TRUE
  )

  fig
}
