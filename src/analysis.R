#! /usr/bin/env Rscript
# analysis.R
# Ha Dinh, December 2017
#
# This script analyzes data and output a table analysis results. 
# 
# Usage: Rscript analysis.R dataset output_file
#
# Arguments: 
# dataset: path and file name for dataset you want to analyze
# output_file: path to and name of output file that contains analysis results. 
#
# Example: 
# Rscript analysis.R "../data/data_for_analysis/budget_price_rating.csv" "../reports/regression_analysis.csv"

# load important library
library(tidyverse)
library(broom)

# setup option to disable scientific notation
options(scipen=999)

# read analysis data
df <- read.csv("../data/data_for_analysis/budget_price_rating.csv", row.names = NULL)

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
write.csv(reg_table, "../results/regression_analysis.csv", row.names = FALSE)
