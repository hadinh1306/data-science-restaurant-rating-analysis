# Driver script
# HD Dec 2017
# 
# Usage: 
# - to run all analysis pipeline: make all
# - to delete all outputs from analysis pipline: make clean

all: reports/report.md

###############################
#--------Data Wrangling-------#
###############################

# download raw data
## download restaurant data
data/raw_data/geoplaces2.csv: src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/geoplaces2.csv
	Rscript src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/geoplaces2.csv data/raw_data/geoplaces2.csv

## download consumer data
data/raw_data/userprofile.csv: src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/userprofile.csv
	Rscript src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/userprofile.csv data/raw_data/userprofile.csv
	
## download rating data
data/raw_data/rating_final.csv: src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/rating_final.csv
	Rscript src/download_data.R https://github.com/hadinh1306/data-science-restaurant-rating-analysis/raw/master/data/raw_data/rating_final.csv data/raw_data/rating_final.csv

# clean up data and combine all raw data to a single table
data/data_for_analysis/budget_price_rating.csv: src/clean_data.R data/raw_data/geoplaces2.csv data/raw_data/userprofile.csv data/raw_data/rating_final.csv
	Rscript src/clean_data.R data/raw_data/geoplaces2.csv data/raw_data/userprofile.csv data/raw_data/rating_final.csv data/data_for_analysis/budget_price_rating.csv

###############################
#--------Data Analysis--------#
###############################

# exploratory analysis
results/exploratory_plot.jpg: src/exploratory_plot.R data/data_for_analysis/budget_price_rating.csv
	Rscript src/exploratory_plot.R data/data_for_analysis/budget_price_rating.csv results/exploratory_plot.jpg

# regression analysis
results/regression_analysis.csv: src/exploratory_plot.R data/data_for_analysis/budget_price_rating.csv
	Rscript src/regression_analysis.R data/data_for_analysis/budget_price_rating.csv reports/regression_analysis.csv
	
###############################
#------------Report-----------#
###############################

reports/report.md: src/report.Rmd results/exploratory_plot.jpg
	Rscript -e 'ezknitr::ezknit(\"src/report.Rmd\", out_dir = \"reports\")'


###############################
#------------Clean------------#
###############################
clean: 
	rm -f data/raw_data/geoplaces2.csv
	rm -f 