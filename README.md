# [Data Science Project] Does difference in Consumer Budget and Restaurant Price Affect Consumer Overall Rating?

**Project start date**: November 22nd, 2017.

## **Directory Information**
`data`: raw data and cleaned data for analysis.

`src`: project source codes.

`results`: results from explanatory analysis and regression analysis.

`reports`: analysis reports.

`other`: unrelated or poor-quality files to the analysis.

`packrat`: reproducible project management. DO NOT modify.

## **Project Overview**
Difference in consumer budget and restaurant actual price may affect consumer's rating for restaurants. In this project, I will analyze whether this difference actually leads to different ratings, using linear regression model.

My explanatory variables are restaurant price and consumer budget. My response variable is rating.

## **Data Description**
For this analysis, I used *[Restaurant Data with Consumer Ratings](https://www.kaggle.com/uciml/restaurant-data-with-consumer-ratings)* from Kaggle. I chose 3 datasets over 9 that are available in the source. These are:
- geoplaces2.csv: this file contains information for many restaurants around Mexico, with 130 observations (rows) and 21 attributes (columns). For my analysis purpose, I chose attributes `placeID` and `price` from this file. There is no missing values from these 2 attributes.
  - `price` is a categorical variable with 3 levels: low, medium, high.

- userprofile.csv: this file contains information of consumers who came to those restaurants, with 138 observations and 19 attributes. For my analysis purpose, I chose attributes `userID` and `budget` from this file. There are 7 missing values from `budget`, which were removed from my final dataset.
  - `budget` is a categorical variable with 3 level: low, medium, high.

- rating_final.csv: this file contains rating from each consumer to different restaurants, with 1161 observations and 5 attributes. For my analysis purpose, I choose attributes `userID`, `placeID`, and `rating` from this file. There is no missing values from thse 3 attributes.
  - `rating` is a numerical variable with 3 values: 0, 1, 2.

## **Hypothesis**
- Null hypothesis: Average ratings are similar despite difference of similarity between consumer budget and restaurant price.
- Alternative hypothesis: Average ratings are different among different combination of consumer budget and restaurant price.

## **Data summary and visualization**
To summarize the data, as well as to visualize the interactive relationship among different groups of consumer budget and restaurant price, I want to create an interactive plot.  

To summarize my findings, I will include a table of p-value comparison for each hypothesis.

All of my visualizations and findings will be documented in my final report.

## **How to run analysis and report**
## **Automatic way**:

Open your **terminal** or its equivalence (e.g. Git Bash, Anaconda Prompt, Command Prompt). You will run through command lines.

1. Get Docker image:

```
docker pull hadinh1306/data-science-restaurant-rating-analysis
```
2. Clone the repo:

```
git clone https://github.com/hadinh1306/data-science-restaurant-rating-analysis.git
```

3. Run Docker image:

```
docker run -it --rm -v YOUR_LOCAL_DIRECTORY_OF_CLONED_REPO/:/home/data-science-restaurant-rating-analysis hadinh1306/data-science-restaurant-rating-analysis /bin/bash
```

4. Change directory:

```
cd home/data-science-restaurant-rating-analysis
```

5. Run the project:

```
make all
```

To clean previous output files:

```
make clean
```

### **Manual way**:
In case you cannot run it automatically, here is another option.

First, open this project in R by clicking on `analysis.Rproj`. Keep it opened. Your Rstudio will be set up with all packages needed for this analysis.

![](/other/readme-instruction-rproj.JPG)

Second, open your **terminal** or its equivalence (e.g. Git Bash, Anaconda Prompt, Command Prompt). You will run with command lines.  

First, go to where your save the project. Then run the report in the following order of scripts in **src** folder:

1. **Download data**: this script helps you to download raw data. It outputs the data file to **data/raw_data** folder.

For this project, you cannot paste the link from Kaggle to this command line. The only way is to download directly from the website.

This script works for other data that can be downloaded directly through an URL. If you need to download 3 datasets, run this 3 times.

[download_data.R](src/download_data.R)

```
Rscript download_data.R "URL_to_download_data" "output_file"
```

2. **Clean data**: this script helps clean missing data and combine datasets to final dataset for analysis. It outputs a clean dataset in **data/data_for_analysis** folder.

There are 3 datasets needed in this analysis. Please include them all.

[clean_data.R](src/clean_data.R)

```
Rscript clean_data.R "../data/raw_data/geoplaces2.csv" "../data/raw_data/userprofile.csv" "../data/raw_data/rating_final.csv" "../data/data_for_analysis/budget_price_rating.csv"
```

3. **Exploratory analysis**: this script helps create an interactive plot to summarize data and visualize the interaction among different consumer budget groups and restaurant price groups. It outputs an interactive plot in **results** folder.

[exploratory_plot.R](src/exploratory_plot.R)

```
Rscript exploratary_plot.R "../data/data_for_analysis/budget_price_rating.csv" "../reports/exploratory_plot.jpg"
```

4. **Regression analysis**: this script helps run a regression analysis to check the hypothesis. It outputs a statistics summary table for this analysis in **results** folder.

[regression_analysis.R](src/regression_analysis.R)

```
Rscript regression_analysis.R "../data/data_for_analysis/budget_price_rating.csv" "../reports/regression_analysis.csv"
```

5. **Export report to .md file**:

Run this line in your terminal:

```
Rscript -e 'ezknitr::ezknit(\"src/report.Rmd\", out_dir = \"reports\")'
```
