
# load packages -----------------------------------------------------------

library(tidyverse)
library(scales)
library(ambient)
library(here)
library(ggthemes)
library(ggforce)
library(systemfonts)

# typical helper functions ------------------------------------------------

sample_shades <- function(n) {
  #sample(colours(distinct = FALSE), n)
  shades <- sample(canva_palettes,1)[[1]]
  shades <- sample(shades)
  return(shades)
}

blend_shades <- function(x, y, p = .5) {
  x <- col2rgb(x)
  y <- col2rgb(y)
  z <- round(p*x + (1-p)*y)
  z <- rgb(red = z[1, ]/255, green = z[2, ]/255, blue = z[3, ]/255)
  return(z)
}

save_path <- function(sys_id, sys_version, seed, fmt = ".png") {
  sys_version <- sys_version %>% str_pad(width = 2, pad = "0")
  seed <- seed %>% str_pad(width = 3, pad = "0")
  base <- paste(sys_id, sys_version, seed, sep = "_")
  file <- paste0(base, fmt)
  path <- here("image", file)
  return(path)
}


# the thing I want to play with -------------------------------------------

heart_x <- function(angle) {
  x <- (16 * sin(angle)^3)/17
  return(x - mean(x))
}

heart_y <- function(angle) {
  y <- (13 * cos(angle) - 5 * cos(2 * angle) - 2 * cos(3 * angle) -
          cos(4 * angle))/17
  return(y - mean(y))
}

perlin_heart <- function(cx = 0, cy = 0, n = 100, noise_max = 0.5,
                         octaves = 2, r_min = 0.5, r_max = 1) {
  tibble(
    angle = seq(0, 2*pi, length.out = n),
    xoff = cos(angle) %>% rescale(from = c(-1, 1), to = c(0, noise_max)),
    yoff = sin(angle) %>% rescale(from = c(-1, 1), to = c(0, noise_max)),
    r = gen_simplex %>%
      fracture(fractal = fbm, x = xoff, y = yoff, octaves = octaves) %>%
      rescale(from = c(-0.5, 0.5), to = c(r_min, r_max)),
    x = r * heart_x(angle) + cx,
    y = r * heart_y(angle) + cy
  )
}


# generate image ----------------------------------------------------------

generate_image <- function(seed, sys_version) {

  bg <- "grey30"
  xlim <- c(0.3, 9.7)
  ylim <- c(0.2, 5.6)
  sys_id <- "perlin-heart"


  set.seed(seed)

  perlin_heart_l <- lift_dl(perlin_heart)

  cx <- 1:9
  cy <- 5*(1:4)/4

  dat <- expand_grid(cx = cx, cy = cy - .05, r_min = .225, r_max = .3) %>%
    mutate(id = row_number()) %>%
    filter(!(id %in% c(7, 11, 15, 14, 18, 22, 26, 30))) %>%
    select(-id) %>%
    transpose() %>%
    imap_dfr(~ perlin_heart_l(.x) %>% mutate(id = .y))

  rectify <- function(.x) {
    tibble(
      x = .x$cx + c(-.42, .42, .42, -.42),
      y = .x$cy + c(-.8, -.8, .3, .3)
    )
  }

  cards <- expand_grid(cx = cx, cy = cy) %>%
    mutate(id = row_number()) %>%
    filter(!(id %in% c(7, 11, 15, 14, 18, 22, 26, 30))) %>%
    select(-id) %>%
    transpose() %>%
    imap_dfr(~ rectify(.x) %>% mutate(id = .y))

  cards2 <- expand_grid(cx = cx, cy = cy) %>%
    mutate(id = row_number()) %>%
    filter((id %in% c(7, 11, 15, 14, 18, 22, 26, 30))) %>%
    select(-id) %>%
    transpose() %>%
    imap_dfr(~ rectify(.x) %>% mutate(id = .y))

  letters <- expand_grid(cx = cx, cy = cy) %>%
    mutate(id = row_number()) %>%
    filter((id %in% c(7, 11, 15, 14, 18, 22, 26, 30))) %>%
    mutate(letter = c("b", "s", "c", "4", "a", "r", "d", "s"))

  pic <- dat %>%
    ggplot(aes(x, y, group = id, fill = sample(id))) +
    geom_shape(
      data = cards,
      show.legend = FALSE,
      colour = "grey40",
      size = 1,
      radius = .01,
      fill = NA
    ) +
    geom_shape(
      data = cards2,
      show.legend = FALSE,
      fill = "grey60",
      radius = .01
    ) +
    geom_text(
      data = letters,
      mapping = aes(cx, cy - .25, label = letter),
      inherit.aes = FALSE,
      size = 22,
      colour = "grey20",
      family = "Ubuntu Mono",
      fontface = "bold"
    ) +
    geom_polygon(size = 0, show.legend = FALSE) +
    theme_void() +
    theme(plot.background = element_rect(fill = bg)) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_gradientn(colours = sample_shades(3)) +
    coord_fixed(xlim = xlim, ylim = ylim) +
    NULL

  ggsave(
    filename = here::here("other", "twitter-card.png"),
    plot = pic,
    width = 9.4,
    height = 5.4,
    dpi = 300
  )
}


# plot parameters ---------------------------------------------------------

generate_image(seed = 36)



