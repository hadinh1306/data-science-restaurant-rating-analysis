#! /usr/bin/env Rscript
# clean_data.R
# Ha Dinh, November 2017
#
# This script download a dataset in .csv files and put these files to data/raw-data. 
# If you need to download 3 datasets, run this script 3 times. 
# 
# Usage: Rscript download_data.R link_to_download output_file
#
# Arguments: 
# link_to_download: a URL that contains .csv dataset you want to download
# output_file: name of file and file extension you want for your downloaded dataset