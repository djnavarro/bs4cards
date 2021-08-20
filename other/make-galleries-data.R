
galleries <- tibble::tribble(
  ~long_name,               ~short_name,    ~date,        ~blurb,                                                                            ~paintbrushes,
  "Ash Cloud and Blood",    "ash",          "2021-07-17", "Simulated watercolours in ggplot2 using the transparent polygon method",          "ggplot2",
  "Ghosts on Marble Paper", "ghosts",       "2021-01-09", "Abstract landscapes generated using ambient",                                     "ambient",
  "Ice Floes",              "ice-floes",    "2021-01-19", "Abstract icebergs generated using ambient",                                       "ambient",
  "Native Flora",           "native-flora", "2021-02-10", "Collections of small flametrees that resemble branching plants",                  "ggplot2 flametree",
  "Silhouettes",            "silhouettes",  "2021-01-24", "Trees generated in flametree with random walk backgrounds",                       "ggplot2 rcpp flametree",
  "Track Marks",            "track-marks",  "2020-09-20", "Voronoi tessellations with seed points sampled from an iterated function system", "ggplot2 rcpp",
  "Viewports",              "viewports",    "2021-02-28", "Simple masks with ggfx using flametree-generated textures"                      , "ggplot2 flametree"
)

usethis::use_data(galleries)
