
#' Create a deck of cards
#'
#' @param cards List of cards
#' @param type Bootstrap class to define the grid ("card-group" or "card-deck")
#'
#' @return sdfgdfg
#' @export
#'
#' @examples
card_grid <- function(cards, type = "card-group") {

  deck_tag <- cards %>%
    htmltools::div(class = type) %>%
    htmltools::div(class = "row") %>%
    htmltools::div(class = "container")

  return(deck_tag)
}
