
#' Create a deck of cards
#'
#' @param cards List of cards
#' @param col_spec Bootstrap classes to specify width of card
#' @param type Bootstrap class to define the grid ("card-group" or "card-deck")
#'
#' @return sdfgdfg
#' @export
#'
#' @examples
card_grid <- function(cards, col_spec = "col-12 col-md-4", type = "card-group") {

  wrap_card <- function(card) {
    col_classes <- paste(col_spec, "d-flex align-items-stretch")
    return(card %>% htmltools::div(class = col_classes))
  }

  deck_tag <- cards %>%
    lapply(wrap_card) %>%
    htmltools::div(class = type) %>%
    htmltools::div(class = "row") %>%
    htmltools::div(class = "container")

  return(deck_tag)
}
