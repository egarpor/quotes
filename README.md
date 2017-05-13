<!-- README.md is generated from README.Rmd. Please edit that file -->
quotes
======

[![Travis-CI Build Status](https://travis-ci.org/egarpor/quotes.svg)](https://travis-ci.org/egarpor/quotes) [![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

Overview
--------

Random quotes directly from `R`! A collection of quotes for a variety of topics and from renowned personalities. Useful for illustrating text mining analyses.

Install
-------

``` r
# install.packages("devtools")
library(devtools)
install_github("egarpor/quotes")
```

Usage
-----

### Random quotes

``` r
# Load package
library(quotes)

# Random quotes
set.seed(654321)
rquotes(n = 1)
#>       id
#> 1: 74433
#>                                                                                       quote
#> 1: It is the working man who is the happy man. It is the idle man who is the miserable man.
#>               author topic
#> 1: Benjamin Franklin  work
rquotes(n = 1, top = "science")
#>       id
#> 1: 55390
#>                                                                                                                                                                               quote
#> 1: It's a good question, because a movie isn't good or bad based on its politics. It's usually good or bad for other reasons, though you might agree or disagree with its politics.
#>         author    topic
#> 1: Roger Ebert politics
rquotes(n = 1, auth = "Bertrand Russell")
#>     id
#> 1: 306
#>                                                                                       quote
#> 1: Old age is ready to undertake tasks that youth shirked because they would take too long.
#>                 author topic
#> 1: W. Somerset Maugham   age
```

### Wordcloud for topic-related quotes

``` r
# Load packages
library(quotes)
library(tm)
library(wordcloud)
library(viridis)

for (top in c("time", "life", "knowledge")) {

  # Preprocessing
  corpus <- Corpus(VectorSource(quotes[topic == top]$quote))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, removeWords, c(stopwords("english"), top))
  corpus <- tm_map(corpus, stemDocument)
  
  # Wordcloud
  wordcloud(corpus, max.words = 100, col = viridis(100))
  title(paste("Wordcloud for topic \"", top, "\"", sep = ""))

}
```

<img src="README/README-wordcloud-1.png" style="display: block; margin: auto;" /><img src="README/README-wordcloud-2.png" style="display: block; margin: auto;" /><img src="README/README-wordcloud-3.png" style="display: block; margin: auto;" />

Credits
-------

The data has been extracted from the *Famous Quotes Database* availiable on <http://thewebminer.com/download>.
