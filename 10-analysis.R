---
title: "Analysis"
author: "SR White"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library("here")
```

## R Markdown

```{r}

DATA <- readRDS(here("data","data_cleaned.rds"))

```