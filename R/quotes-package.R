

#' @title Collection of quotes for a variety of topics and from renowned personalities
#'
#' @description Random quotes directly from \code{R}! A collection of 61,071 unique quotes for a variety of topics and from renowned personalities. Useful for illustrating text mining analyses.
#'
#' @author Eduardo Garcia-Portugues (\email{edgarcia@@est-econ.uc3m.es}).
#' @docType package
#' @name quotes-package
NULL


#' @title quotes dataset
#'
#' @description A collection of 61,071 unique quotes for a variety of topics and from renowned personalities.
#'
#' @docType data
#' @usage quotes
#' @format A \code{data.table} object with 75,966 rows and the following columns:
#' \itemize{
#' \item{\code{id} quote's identifier.}
#' \item{\code{quote} quote's text.}
#' \item{\code{author} quote's author.}
#' \item{\code{topic} quote's subject classification.}
#' }
#' @source Data extracted from the \emph{Famous Quotes Database} availiable on \url{http://thewebminer.com/download}.
#' @examples
#' # Unique quotes (repeated depending on the topic classification)
#' uniques <- unique(quotes$quote)
#' length(uniques)
#' 
#' # Wordcloud for a given topic
#' 
#' ## Required packages
#' library(tm)
#' library(SnowballC)
#' library(wordcloud)
#' library(viridis)
#' 
#' ## Preprocessing
#' top <- "time"
#' corpus <- Corpus(VectorSource(quotes[topic == top]$quote))
#' corpus <- tm_map(corpus, removePunctuation)
#' corpus <- tm_map(corpus, stripWhitespace)
#' corpus <- tm_map(corpus, removeNumbers)
#' corpus <- tm_map(corpus, removeWords, c(stopwords("english"), top))
#' corpus <- tm_map(corpus, stemDocument)
#' 
#' ## Wordcloud
#' \dontrun{
#' wordcloud(corpus, max.words = 100, col = viridis(100))
#' title(paste("Wordcloud for topic \"", top, "\"", sep = ""))
#' }
#' @rdname quotes
"quotes"
