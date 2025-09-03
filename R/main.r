source("R/values_gen.r")
source("R/graphing.r")
source("R/const.r")

### NEEDS `find_true_graph_bounds()`
anim_including_d9 <- function(frames, start_values, end_values) {
  bounds <- find_true_graph_bounds()
  generate_anim(frames, start_values, end_values, categories_effects, bounds)
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

start_params <- list(
  d9 = 100,
  thcv = 0,
  cbd = 0,
  cbn = 0,
  cbg = 0,
  cbc = 0
)

end_params <- list(
  d9 = 80,
  thcv = 0,
  cbd = 5,
  cbn = 5,
  cbg = 10,
  cbc = 0
)

fig <- anim_including_d9(
  frames = 120,
  start_values = c(100, 0, 0, 0, 0, 0),
  end_values = c(80, 0, 5, 5, 10, 0)
)

# htmlwidgets::saveWidget(fig, "plt.html", selfcontained = TRUE)

# fig2 <- generate_graph_inv(
#   list(
#     aroused = 0,
#     hungry = 0,
#     energetic = 0,
#     happy = 0,
#     creative = 0,
#     giggly = 0,
#     uplifted = 0,
#     focused = 0,
#     talkative = 0,
#     relaxed = 10,
#     tingly = 5,
#     euphoric = 10,
#     sleepy = 75
#   ),
#   find_true_graph_bounds_inv()
# )
