### Global Zeugs ###

library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

# optisches
source("theme_me.R")
theme_set(theme_me(axis_title_size = 2, axis_text_size = 1.5, position_x = 0, text_colour_x = "black"))

# data
data <- tibble(
  x = c(rep(1, 4), rep(2, 8), rep(3, 12)),
  y = "1"
)

