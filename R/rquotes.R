

#' @title Quote sampler
#'
#' @description TODO
#'
#' @param n TODO
#' @param author TODO
#' @param genre TODO
#' @inheritParams base::sample
#' @return TODO
#' @details TODO
#' @examples 
#' set.seed(345678)
#' rquotes(n = 10)
#' rquotes(n = 10, genre = "science")
#' rquotes(n = 10, author = "Bertrand Russell")
#' @author Eduardo Garcia-Portugues (\email{edgarcia@@est-econ.uc3m.es}).
#' @export
rquotes <- function(n, author, genre, replace = TRUE) {

  data("quotes")
  if (missing(author) & missing(genre)) {
    
    return(quotes[sample(x = nrow(quotes), size = n, replace = replace), ])
    
  } else {
    
    index <- rep.int(TRUE, nrow(quotes))
    index <- switch(missing(genre) + 1L, quotes$genre == genre, index) &
      switch(missing(author) + 1L, quotes$author == author, index)
    return(quotes[sample(x = which(index), size = n, replace = replace), ])
    
  }

}
