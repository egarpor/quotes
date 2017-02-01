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
rquotes(n = 10, genre = "science")
rquotes(n = 10, author = "Bertrand Russell")
```

### Simple wordcloud

```r
library(tm)
library(wordcloud)
library(viridis)

# Preprocessing
topic <- "time"
corpus <- Corpus(VectorSource(subset(quotes, subset = genre == topic, select = "quote")))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, c(stopwords("english"), topic))
corpus <- tm_map(corpus, stemDocument)
title(paste("Wordcloud for topic \"", topic, "\"", sep = ""))

# Wordcloud
wordcloud(corpus, max.words = 100, col = viridis(100))
```
![Wordcloud](https://github.com/egarpor/quotes/tree/master/images/wordcloud.png)

## Credits

The data has been extracted from the *Famous Quotes Database* availiable on <http://thewebminer.com/download>.