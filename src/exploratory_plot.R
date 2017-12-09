#! /usr/bin/env Rscript
# exploratary_plot.R
# Ha Dinh, December 2017
#
# This script input data for analysis and output an interactive plot in "results" folder. 
# 
# Usage: Rscript exploratary_plot.R input_file output_image
#
# Arguments: 
# input_file: path and file name for dataset you want to do draw an interative plot
# output_image: path to and name of output image. Choose extension of image to be either .png or .jpg
#
# Example: 
# Rscript exploratary_plot.R "../data/data_for_analysis/budget_price_rating.csv" "../reports/exploratory_plot.jpg"

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_image <- args[2]

# define main function
main <- function(){
  # load important packages
  library(tidyverse)
  
  # read in data
  df <- read.csv(input_file, row.names = NULL)
  # transform budget and price to factor
  df$budget <- as.factor(df$budget)
  df$price <- as.factor(df$price)

  # draw interactive plot
  interaction_plot <- df %>% ggplot(aes(budget, rating, color = price, group = price)) +
    stat_summary(fun.y = mean, geom = "point") +
    stat_summary(fun.y = mean, geom = "line") + 
    geom_jitter(alpha = 0.2) + 
    scale_color_brewer(palette="Dark2") +
    scale_y_continuous(breaks = c(0,1,2)) +
    labs(x = "Consumer budget", 
        y = "Rating",
        title = "Interactive Plot",
        subtitle = "Restaurant rating of consumers in relation to their budget and restaurant price", 
        colour = "Restaurant price") +
    theme_bw()
  
  # save plot to jpg file in result folder
  ggsave(output_image, plot = interaction_plot)
}

# call main function
main()
