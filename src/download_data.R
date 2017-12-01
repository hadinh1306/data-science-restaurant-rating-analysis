#! /usr/bin/env Rscript
# download_data.R
# Ha Dinh, November 2017
#
# This script downloads a dataset in .csv files and put these files to data/raw-data. 
# If you need to download 3 datasets, run this script 3 times. 
# 
# Usage: Rscript download_data.R link_to_download output_file
#
# Arguments: 
# link_to_download: a URL that contains .csv dataset you want to download
# output_file: name of file and file extension you want for your downloaded dataset
#
# Example: 
# Rscript download_data.R "https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/geoplaces2.csv" "../data/raw_data/geoplaces2.csv"

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
link_to_download <- args[1]
output_file <- args[2]

# download data
download.file(link_to_download, destfile = output_file)
