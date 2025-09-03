source("R/anim.r")

fig <- anim_effects(
  frames = 120,
  start_values = regress_cnoids_to_effects(
    d9 = 100,
    thcv = 0,
    cbd = 0,
    cbn = 0,
    cbg = 0,
    cbc = 0
  ),
  end_values = regress_cnoids_to_effects(80, 0, 5, 5, 10, 0)
)

fig <- anim_cnoids(
  frames = 120,
  start_values = regress_effects_to_cnoids(aroused = 100),
  end_values = regress_effects_to_cnoids(aroused = 50, happy = 50)
)

htmlwidgets::saveWidget(fig, "plt.html", selfcontained = TRUE)
