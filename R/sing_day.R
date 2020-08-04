#' Takes a noun and makes it plural
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#'
#' @export
sing_day <- function(dataset, line, word_col, phrase_col){

  phrases <- dataset %>% pull({{phrase_col}})
  num_words <- dataset %>% pull({{word_col}})
  phrase_1 <- map(line:1, ~phrases[.x])
  phrase_together <- str_c(phrase_1, collapse = ", ")

  glue::glue("On the {num_words[line]} day of Christmas, my true love gave to me, {phrase_together}")


}



