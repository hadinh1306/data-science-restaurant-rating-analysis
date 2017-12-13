# Driver script
# HD Dec 2017
# 
# Usage: 
# - to run all analysis pipeline: make all
# - to delete all outputs from analysis pipline: make clean

###############################
#--------Data Wrangling-------#
###############################

# download raw data
## download restaurant data
data/raw_data/geoplaces2.csv: https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/geoplaces2.csv
	Rscript src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/geoplaces2.csv data/raw_data/geoplaces2.csv

## download consumer data
data/raw_data/userprofile.csv: https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/userprofile.csv
	Rscript src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/userprofile.csv data/raw_data/userprofile.csv
	
## download rating data
data/raw_data/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/rating_final.csv
	Rscript src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/rating_final.csv data/raw_data/rating_final.csv


