#!/usr/bin/env Rscript

library("optparse")
library("rcnoidanalysis")

option_list <- list(
  make_option(
    c("-t", "--type"),
    type = "character",
    default = NULL,
    help = "One of: [graph, anim]",
    metavar = "type"
  ),
  make_option(
    c("-m", "--mode"),
    type = "character",
    default = NULL,
    help = "One of: [cnoids, effects]",
    metavar = "mode"
  ),
  make_option(
    c("-o", "--out"),
    type = "character",
    default = "out.html",
    help = "Output file path [default: %default]",
    metavar = "path"
  ),
  make_option(
    c("-f", "--frames"),
    type = "numeric",
    default = 240,
    help = "Number of animation frames @ 60fps [default: %default]",
    metavar = "frames"
  ),
  make_option(
    c("-v", "--values"),
    type = "character",
    default = NULL,
    help = "List of values, comma separated.",
    metavar = "values"
  ),
  make_option(
    c("-V", "--values2"),
    type = "character",
    default = NULL,
    help = "List of second values, comma separated.",
    metavar = "values2"
  )
)

opt_parser <- OptionParser(
  option_list = option_list,
  description = "Analyze and processess cnoid data."
)

opt <- parse_args(opt_parser)

if (length(opt$type) == 0 || !opt$type %in% c("graph", "anim")) {
  stop("Arg `type` is not valid.")
}

if (length(opt$mode) == 0 || !opt$mode %in% c("cnoids", "effects")) {
  stop("Arg `mode` is not valid.")
}

if (is.null(opt$values)) {
  stop("Arg `values` is empty.")
}

values <- as.integer(unlist(strsplit(opt$values, ",")))

fig <- NULL
if (opt$type == "graph") {
  if (opt$mode == "cnoids") {
    fig <- graph_cnoids(
      do.call(regress_effects_to_cnoids, as.list(values))
    )
  } else {
    fig <- graph_effects(
      do.call(regress_cnoids_to_effects, as.list(values))
    )
  }
} else {
  if (is.null(opt$values2)) {
    stop("Arg `values2` is empty.")
  }

  values2 <- as.integer(unlist(strsplit(opt$values2, ",")))

  if (opt$mode == "cnoids") {
    fig <- anim_cnoids(
      opt$frames,
      do.call(regress_effects_to_cnoids, as.list(values)),
      do.call(regress_effects_to_cnoids, as.list(values2))
    )
  } else {
    fig <- anim_effects(
      opt$frames,
      do.call(regress_cnoids_to_effects, as.list(values)),
      do.call(regress_cnoids_to_effects, as.list(values2))
    )
  }
}

htmlwidgets::saveWidget(fig, opt$out, selfcontained = TRUE)
