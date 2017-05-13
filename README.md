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

# Ten random quotes
set.seed(12345689)
rquotes(n = 5)
#>       id
#> 1: 24487
#> 2:  1949
#> 3: 39499
#> 4: 22173
#> 5: 69195
#>                                                                                                                                                                                                                           quote
#> 1: We are willing enough to praise freedom when she is safely tucked away in the past and cannot be a nuisance. In the present, amidst dangers whose outcome we cannot foresee, we get nervous about her, and admit censorship.
#> 2:                                                                                                                                       It is my personality alone that has brought back the waltz and made it a global craze.
#> 3:                                                                                             It takes most men five years to recover from a college education, and to learn that poetry is as vital to thinking as knowledge.
#> 4:                                                                                                                         I have this fear of falling in front of large groups of people. That's why I tend not to wear heels.
#> 5:                            Life is an unfoldment, and the further we travel the more truth we can comprehend. To understand the things that are at our door is the best preparation for understanding those that lie beyond.
#>             author     topic
#> 1:   E. M. Forster   freedom
#> 2:      Andre Rieu     alone
#> 3: Brooks Atkinson knowledge
#> 4:    Taylor Swift      fear
#> 5:         Hypatia    travel
rquotes(n = 5, top = "science")
#>       id
#> 1:  4474
#> 2: 54436
#> 3:  7830
#> 4: 43318
#> 5: 47512
#>                                                                                                                                                                                                                                                                           quote
#> 1:                                                                                                                                                                It's an honor putting art above politics. Politics can be seductive in terms of things reductive to the soul.
#> 2:                                                                                                                                                                                                             If there's no money in poetry, neither is there poetry in money.
#> 3:                                                                                                                                      As a restaurateur, my job is to basically control the chaos and the drama. There's always going to be chaos in the restaurant business.
#> 4: I believe that imagination is stronger than knowledge. That myth is more potent than history. That dreams are more powerful than facts. That hope always triumphs over experience. That laughter is the only cure for grief. And I believe that love is stronger than death.
#> 5:                                                                                                                                   Our greatest lack is not money for any undertaking, but rather ideas, If the ideas are good, cash will somehow flow to where it is needed.
#>                author    topic
#> 1:     Robert Redford      art
#> 2:      Robert Graves   poetry
#> 3:    Rocco DiSpirito business
#> 4:     Robert Fulghum     love
#> 5: Robert H. Schuller    money
rquotes(n = 5, auth = "Bertrand Russell")
#>       id
#> 1: 58329
#> 2: 63435
#> 3: 59064
#> 4:  1122
#> 5: 63110
#>                                                                                                                                                                                  quote
#> 1: I still like the relationship part of any story. You don't want your character to figure everything out and then at the end of the day, go home and eat soup from a can by herself.
#> 2:                                                                                                         This could never be a crime in any society which deems himself enlightened.
#> 3:                                                                                                My religion centers in different areas than what's considered conventional religion.
#> 4:                                                                                            An artist is always alone - if he is an artist. No, what the artist needs is loneliness.
#> 5:                                                                            The forces in a capitalist society, if left unchecked, tend to make the rich richer and the poor poorer.
#>              author        topic
#> 1:     Lisa Gardner relationship
#> 2:   Jack Kevorkian      society
#> 3:   Jack Kevorkian     religion
#> 4:     Henry Miller        alone
#> 5: Jawaharlal Nehru      society
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
