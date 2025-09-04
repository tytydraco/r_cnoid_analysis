source("R/helpers.r")

fig1 <- anim_cnoids(
  240,
  regress_effects_to_cnoids(aroused = 100),
  regress_effects_to_cnoids(energetic = 100)
)
fig2 <- graph_cnoids(
  regress_effects_to_cnoids(aroused = 100)
)
fig3 <- anim_effects(
  240,
  regress_cnoids_to_effects(d9 = 100),
  regress_cnoids_to_effects(cbd = 100)
)
fig4 <- graph_effects(
  regress_cnoids_to_effects(d9 = 100)
)

# htmlwidgets::saveWidget(fig, "plt.html", selfcontained = TRUE)
