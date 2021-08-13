

#' Use the strapless css library
#'
#' @param destdir directory to install the strapless library
#' @param source set source = "local" to use the cached copy, source = "github" to download
#'
#' @return path to file
#' @export
#'
use_strapless <- function(destdir = ".", source = "local") {
  destfile <- fs::path(destdir, "strapless.css")
  if(source == "local") {
    path <- system.file("extdata", "strapless.css", package = "bs4cards")
    fs::file_copy(path, destfile, overwrite = TRUE)
    return(invisible(NULL))
  }
  if(source == "github") {
    url <- "https://github.com/djnavarro/strapless/releases/download/0.0.0.9000/strapless.css"
    download.file(url, destfile)
    return(invisible(NULL))
  }
  stop('source must be "local" or "github"', call. = FALSE)
}
