quotes
======

[![Travis-CI Build Status](https://travis-ci.org/egarpor/quotes.svg)](https://travis-ci.com/egarpor/quotes)
[![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

## Overview

Random quotes directly from `R`! A collection of quotes for a variety of topics and from renowned personalities, useful for illustrating text mining analyses.

## Install

```r
library(devtools)
install_github("egarpor/quotes")
```

## Usage

### Random quotes

```r
rquotes(n = 10)
rquotes(n = 10, top = "science")
rquotes(n = 10, auth = "Bertrand Russell")
```

### Simple wordcloud

```r
library(tm)
library(wordcloud)
library(viridis)

# Preprocessing
top <- "time"
corpus <- Corpus(VectorSource(quotes[topic == top]$quote))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, c(stopwords("english"), top))
corpus <- tm_map(corpus, stemDocument)

# Wordcloud
wordcloud(corpus, max.words = 100, col = viridis(100))
title(paste("Wordcloud for topic \"", top, "\"", sep = ""))
```
![Wordcloud](https://raw.githubusercontent.com/egarpor/quotes/master/images/wordcloud.png)

## Credits

The data has been extracted from the *Famous Quotes Database* availiable on <http://thewebminer.com/download>.