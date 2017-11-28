#! /usr/bin/env Rscript
# download_data.R
# Ha Dinh, November 2017
#
# This script load a dataset in .csv files to R and output its first 10 rows in .csv file. 
# If you need to load 3 datasets, run this script 3 times. 
# 
# Usage: Rscript load_data.R input_file output_file

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

main <- function(){
  # read in data
  data <- read.csv(file = input_file)
  
  # subset first 10 rows of data
  data_subset <- head(data, 10)
  
  # save this subset to other folder
  write.csv(data_subset, file = output_file)
}

# call main function
main()
