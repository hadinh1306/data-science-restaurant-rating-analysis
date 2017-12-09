#! /usr/bin/env Rscript
# regression_analysis.R
# Ha Dinh, December 2017
#
# This script analyzes data and output a table analysis results. 
# 
# Usage: Rscript regression_analysis.R input_file output_file
#
# Arguments: 
# input_file: path and file name for dataset you want to analyze
# output_file: path to and name of output file that contains analysis results. 
#
# Example: 
# Rscript regression_analysis.R "../data/data_for_analysis/budget_price_rating.csv" "../reports/regression_analysis.csv"

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# define main function
main <- function(){
  # setup option to disable scientific notation
  options(scipen=999)
  
  # load important library
  library(tidyverse)
  library(broom)
  
  # read analysis data
  df <- read.csv(input_file, row.names = NULL)
  
  # transform budget and price to factor
  df$budget <- as.factor(df$budget)
  df$price <- as.factor(df$price)
  
  # run linear regression analysis
  reg <- lm(rating~budget*price, data = df)
  # summary of linear model
  reg_summary <- summary(reg)
  reg_summary
  
  
  # put test statistics to a table
  reg_table <- tidy(reg)
  reg_table$p.value <- format(round(reg_table$p.value, 9), nsmall = 9)
  
  # output test statistics to csv file
  write.csv(reg_table, output_file, row.names = FALSE)
}

# call main function
main()