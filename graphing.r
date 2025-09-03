source("const.r")

library(plotly)

generate_graph <- function(params, bounds) {
  values <- generate_values(
    params$d9,
    params$thcv,
    params$cbd,
    params$cbn,
    params$cbg,
    params$cbc,
  )

  # Repeat the first value to close the loop
  values <- c(values, values[1])
  categories <- c(categories, categories[1])

  # Mirror to match Google Sheets
  values <- rev(values)
  categories <- rev(categories)

  fig <- plot_ly(
    line = list(shape = "spline"),
    type = "scatterpolar",
    mode = "lines",
    r = values,
    theta = categories,
    fill = "toself"
  )

  fig <- fig %>%
    layout(
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

  fig <- plot_ly(
    line = list(shape = "spline"),
    type = "scatterpolar",
    mode = "lines",
    r = values,
    theta = categories,
    fill = "toself"
  )

  fig <- fig %>%
    layout(
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

generate_anim <- function(frames, start_params, end_params, bounds) {
  theta <- rev(c(categories_effects, categories_effects[1]))
  all_r <- numeric()
  all_theta <- character()
  all_frame <- integer()

  for (i in seq_len(frames)) {
    frac <- if (frames == 1) 1 else (i - 1) / (frames - 1)

    d9_i <- lerp(start_params$d9, end_params$d9, frac)
    thcv_i <- lerp(start_params$thcv, end_params$thcv, frac)
    cbd_i <- lerp(start_params$cbd, end_params$cbd, frac)
    cbn_i <- lerp(start_params$cbn, end_params$cbn, frac)
    cbg_i <- lerp(start_params$cbg, end_params$cbg, frac)
    cbc_i <- lerp(start_params$cbc, end_params$cbc, frac)

    vals <- generate_values(d9_i, thcv_i, cbd_i, cbn_i, cbg_i, cbc_i)
    vals <- c(vals, vals[1]) # close the radial loop
    vals <- rev(vals) # mirror values to match reversed theta

    all_r <- c(all_r, vals)
    all_theta <- c(all_theta, theta)
    all_frame <- c(all_frame, rep(i, length(theta)))
  }

  df <- data.frame(
    frame = all_frame,
    theta = all_theta,
    r = all_r,
    stringsAsFactors = FALSE
  )

  df$frame <- factor(df$frame, levels = unique(df$frame))
  df$theta <- factor(df$theta, levels = unique(theta))

  fig <- plot_ly(
    data = df,
    type = "scatterpolar",
    mode = "lines",
    r = ~r,
    theta = ~theta,
    frame = ~frame,
    fill = "toself",
    line = list(shape = "spline")
  ) %>%
    layout(
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
    ) %>%
    animation_opts(frame = 16.666666667, transition = 0, redraw = TRUE)

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

### NEEDS `find_true_graph_bounds()`
anim_including_d9 <- function(frames, start_params, end_params) {
  bounds <- find_true_graph_bounds()
  generate_anim(frames, start_params, end_params, bounds)
}

### FOR NORMALIZATION:
### - ON: compare effect profile, not intensity
### - OFF: compare effect profile, with intensity
###        (harder to read bc scale is 0-100)
anim_cnoids <- function(frames, start_params, end_params) {
  # Normalize...
  normalize_params <- function(params) {
    max_abs <- max(abs(unlist(params)))
    if (max_abs == 0) {
      return(params) # Avoid division by zero
    }
    lapply(params, function(x) x / max_abs)
  }

  norm_start_params <- normalize_params(start_params)
  norm_end_params <- normalize_params(end_params)

  generate_anim(frames, norm_start_params, norm_end_params, c(-1, 1))
}
