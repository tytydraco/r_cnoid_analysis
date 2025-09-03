source("values_gen.r")
source("graphing.r")

library(plotly)

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
  start_params = start_params,
  end_params = end_params
)

htmlwidgets::saveWidget(fig, "plt.html", selfcontained = TRUE)

fig2 <- generate_graph_inv(
  list(
    aroused = 0,
    hungry = 0,
    energetic = 0,
    happy = 0,
    creative = 0,
    giggly = 0,
    uplifted = 0,
    focused = 0,
    talkative = 0,
    relaxed = 10,
    tingly = 5,
    euphoric = 10,
    sleepy = 75
  ),
  find_true_graph_bounds_inv()
)
