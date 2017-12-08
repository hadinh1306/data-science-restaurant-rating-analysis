#! /usr/bin/env Rscript
# clean_data.R
# Ha Dinh, December 2017
#
# This script cleans all datasets and combine them to one final dataset for analysis. 
# 
# Usage: Rscript clean_data.R restaurant_data consumer_data rating_data output_file
#
# Arguments: 
# file_1: path and file name for dataset that contains restaurant information
# file_2: path and file name for dataset that contains consumer information
# file_3: path and file name for dataset that contains rating information
# output_file: path to and name of output file
#
# Example: 
# Rscript clean_data.R "../data/raw_data/restaurant.csv" "../data/raw_data/consumer.csv" "../data/raw_data/rating.csv" "../data/data_for_analysis/final.csv"


library(tidyverse)
library(forcats)

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
restaurant_data <- args[1]
file_2 <- args[2]
file_3 <- args[3]
output_file <- args[4]


# load data
restaurant <- read.csv(file_1)
consumer <- read.csv("../data/raw_data/userprofile.csv")
rating <- read.csv("../data/raw_data/rating_final.csv")

# drop row names
row.names(restaurant) <- NULL
row.names(consumer) <- NULL
row.names(rating) <- NULL

# select important columns from each dataframe
restaurant <- restaurant %>% select(placeID, price)
consumer <- consumer %>% select(userID, budget)
rating <- rating %>% select(placeID, userID, rating)

# check size of each dataframe
dim(restaurant)
dim(consumer)
dim(rating)

# join dataframes
join_df <- left_join(restaurant, rating, by = 'placeID') %>% 
  left_join(.,consumer, by = 'userID')
row.names(join_df) <- NULL

# filter NA values 
join_df <- join_df %>% 
  filter(budget != "?")

# transform factor levels (low, medium, high) to number (1, 2, 3) for easy comparison
join_df$budget <- fct_recode(join_df$budget, "1" = "low", "2" = "medium", "3" = "high")
join_df$budget <- fct_drop(join_df$budget)
levels(join_df$budget)
join_df$budget <- as.numeric(as.character(join_df$budget))

join_df$price <- fct_recode(join_df$price, "1" = "low", "2" = "medium", "3" = "high")
levels(join_df$price)
join_df$price <- as.numeric(as.character(join_df$price))


# categorize different budget-price groups
final_df <- join_df %>% 
  mutate(analysis_group = case_when(budget == price ~ "equal",
                                    budget < price ~ "lower",
                                    budget > price ~ "higher")) %>% 
  select(budget, price, rating, analysis_group)


# output cleaned dataframe
write.csv(final_df, file = output_file, row.names = FALSE)

