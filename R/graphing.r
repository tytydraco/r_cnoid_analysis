source("R/const.r")
source("R/values_gen.r")

#' @import plotly
generate_graph <- function(values, categories, bounds) {
  # Repeat the first value to close the loop
  values <- c(values, values[1])
  categories <- c(categories, categories[1])

  # Mirror to match Google Sheets
  values <- rev(values)
  categories <- rev(categories)

  fig <- plotly::plot_ly(
    line = list(shape = "spline"),
    type = "scatterpolar",
    mode = "lines",
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

#' @import plotly
generate_graph_inv <- function(params, bounds) {
  values <- generate_values_inv(
    params$aroused,
    params$hungry,
    params$energetic,
    params$happy,
    params$creative,
    params$giggly,
    params$uplifted,
    params$focused,
    params$talkative,
    params$relaxed,
    params$tingly,
    params$euphoric,
    params$sleepy
  )

  # Repeat the first value to close the loop
  values <- c(values, values[1])
  categories <- c(categories_cnoids, categories_cnoids[1])

  # Mirror to match Google Sheets
  values <- rev(values)
  categories <- rev(categories)

  fig <- plotly::plot_ly(
    line = list(shape = "spline"),
    type = "scatterpolar",
    mode = "lines",
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

#' @import plotly
generate_anim <- function(
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
    mode = "lines",
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

lerp <- function(start, end, fraction) {
  (end - start) * fraction + start
}

find_true_graph_bounds <- function() {
  all_values <- c(
    generate_values(100, 0, 0, 0, 0, 0),
    generate_values(0, 100, 0, 0, 0, 0),
    generate_values(0, 0, 100, 0, 0, 0),
    generate_values(0, 0, 0, 100, 0, 0),
    generate_values(0, 0, 0, 0, 100, 0),
    generate_values(0, 0, 0, 0, 0, 100)
  )

  c(
    min(all_values),
    max(all_values)
  )
}

find_true_graph_bounds_inv <- function() {
  all_values <- c(
    generate_values_inv(100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0),
    generate_values_inv(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100)
  )

  c(
    min(all_values),
    max(all_values)
  )
}
