

#' @title Sample random quotes
#'
#' @description Random selection of qutes, with optional author and topic filtering.
#'
#' @param n number of quotes to sample.
#' @param auth filter by author, see examples.
#' @param top filter by topic, see examples.
#' @inheritParams base::sample
#' @return A \code{data.frame} formed by \code{n} rows of \code{\link{quotes}}.
#' @details If 
#' @examples 
#' # authors and topics
#' levels(quotes$author)
#' levels(quotes$topic)
#' 
#' # Random quotes
#' set.seed(345678)
#' rquotes(n = 10)
#' rquotes(n = 10, auth = "Bertrand Russell")
#' rquotes(n = 10, top = "science")
#' rquotes(n = 10, auth = "Bertrand Russell", top = "love")
#' @author Eduardo Garcia-Portugues (\email{edgarcia@@est-econ.uc3m.es}).
#' @import data.table
#' @export
rquotes <- function(n, auth, top, replace = FALSE) {

  mauth <- missing(auth)
  mtop <- missing(top)
  if (mauth & mtop) {
    
    nr <- nrow(quotes)
    n <- ifelse(replace, n, min(c(n, nr)))
    index <- sample(x = nr, size = n, replace = replace)
    
  } else if (!mauth & mtop) {
  
    index <- quotes[.(auth)]$id
    if (anyNA(index)) stop(paste("No quotes with author = \"", auth, "\"", sep = ""))
    n <- ifelse(replace, n, min(c(n, length(index))))
    index <- sample(x = index, size = n, replace = replace)
  
  } else if (mauth & !mtop) {
    
    index <- na.omit(quotes[.(unique(author), top)]$id)
    if (length(index) == 0) stop(paste("No quotes with topic = \"", top, "\"", sep = ""))
    n <- ifelse(replace, n, min(c(n, length(index))))
    index <- sample(x = index, size = n, replace = replace)
    
  } else {
    
    index <- quotes[.(auth, top)]$id
    if (anyNA(index)) stop(paste("No quotes with author = \"", auth, 
                                 "\" and topic = \"", top, "\"", sep = ""))
    n <- ifelse(replace, n, min(c(n, length(index))))
    index <- sample(x = index, size = n, replace = replace)

  }
  
  return(quotes[index, ])
  
}



