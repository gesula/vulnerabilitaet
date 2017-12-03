### Global Zeugs ###

library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

# optisches
theme_set(tadaatoolbox::theme_tadaa(bg = "white"))

# data
data <- tibble(
  x = c(rep(1, 4), rep(2, 8), rep(3, 12)),
  y = "1"
)

