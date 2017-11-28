# [Data Science Project] Does difference in Consumer Budget and Restaurant Price Affect Consumer Overall Rating?

## Dataset
Since I'm very interested in cuisine and consumer analysis, I chose *[Restaurant Data with Consumer Ratings](https://www.kaggle.com/uciml/restaurant-data-with-consumer-ratings)* from Kaggle to be my data source.

In this analysis, I use 3 most relevant data files from the 9 datasets provided:
1. geoplaces2.csv
2. rating_final.csv
3. userprofile.csv

## Question that interests me
With this dataset, I want to know whether the difference or similarity between consumer budget and restaurant price affect consumer's overall rating.

## Hypothesis
There are 3 scenarios that can arise from my question:
1. Consumer budget is equal to restaurant price.
2. Consumer budget is higher than restaurant price.
3. Consumer budget is lower than restaurant price.

I want to separate these 3 scenarios to 3 hypothesis sets:

**1. Hypothesis set 1:**
- *Null hypothesis*: Consumers with budget higher than restaurant price has similar rating to those with equal budget to restaurant price.
- *Alternative hypothesis*: Consumers with budget higher than restaurant price has lower rating than those with similar budget to restaurant price.

**2. Hypothesis set 2:**
- *Null hypothesis*: Consumers with budget lower than restaurant price has similar rating to those with equal budget to restaurant price.
- *Alternative hypothesis*: Consumers with budget lower than restaurant price has higher rating than rating of those with equal budget to restaurant price.

**3. Hypothesis set 3:**
- *Null hypothesis*: Consumers with budget lower than restaurant price has similar rating to those with higher budget to restaurant price.
- *Alternative hypothesis*: Consumers with budget lower than restaurant price has higher rating than rating of those with higher budget to restaurant price.

## Data summary and visualization
To summarize the data, I want to have 4 boxplot graphs to compare average overall rating between:
- Consumers with similarity in budget and restaurant price, and consumers with higher budget than restaurant price.
- Consumers with similarity in budget and restaurant price, and consumers with lower budget than restaurant price.
- Consumers with higher budget than restaurant price, and consumers with lower budget than restaurant price.
- Consumers with similarity in budget and restaurant price, consumers with higher budget than restaurant price, and consumers with lower budget than restaurant price.

To summarize my findings, I will include a table of p-value comparison for each hypothesis.

All of my visualizations and findings will be documented in my final report.
