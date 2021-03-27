
#' Create a deck of cards
#'
#' @param cards List of cards
#'
#' @return sdfgdfg
#' @export
#'
#' @examples
card_group <- function(cards) {
  cards %>%
    htmltools::div(class = "card-group") %>%
    htmltools::div(class = "row") %>%
    htmltools::div(class = "container")
}
