
static <- list.files(here::here("other/static/"), all.files = TRUE, recursive = TRUE)
if(!dir.exists(here::here("docs/image"))) {
  dir.create(here::here("docs/image"))
}
lapply(static, function(x) {file.copy(
  from = here::here("other/static/", x),
  to = here::here("docs/", x)
)})
