#! /usr/bin/env Rscript
# clean_data.R
# Ha Dinh, December 2017
#
# This script cleans all datasets and combine them to a final dataset for analysis. 
# 
# Usage: Rscript clean_data.R restaurant_data consumer_data rating_data output_file
#
# Arguments: 
# restaurant_data: path and file name for dataset that contains restaurant information
# consumer_data: path and file name for dataset that contains consumer information
# rating_data: path and file name for dataset that contains rating information
# output_file: path to and name of output file
#
# Example: 
# Rscript clean_data.R "../data/raw_data/restaurant.csv" "../data/raw_data/consumer.csv" "../data/raw_data/rating.csv" "../data/data_for_analysis/final.csv"

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
restaurant_data <- args[1]
consumer_data <- args[2]
rating_data <- args[3]
output_file <- args[4]

# define main function
main <- function(){
  # get packages needed to run this script
  library(tidyverse)
  library(forcats)
  
  # load data
  restaurant <- read.csv(restaurant_data, row.names = NULL)
  consumer <- read.csv(consumer_data, row.names = NULL)
  rating <- read.csv(rating_data, row.names = NULL)
  
  # select important columns from each dataframe
  restaurant <- restaurant %>% select(placeID, price)
  consumer <- consumer %>% select(userID, budget)
  rating <- rating %>% select(placeID, userID, rating)
  
  # join dataframes
  join_df <- left_join(restaurant, rating, by = 'placeID') %>% 
    left_join(.,consumer, by = 'userID')
  row.names(join_df) <- NULL
  
  # filter NA values 
  join_df <- join_df %>% 
    filter(budget != "?") %>% 
    select(placeID, userID, budget, price, rating)
  
  # output cleaned dataframe
  write.csv(join_df, file = output_file, row.names = FALSE)
}

# call main function
main()