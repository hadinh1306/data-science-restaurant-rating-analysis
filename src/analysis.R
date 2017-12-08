#! /usr/bin/env Rscript
# analysis.R
# Ha Dinh, December 2017
#
# This script analyzes data and output a table analysis results. 
#
# In our dataset for analysis, there are 3 groups in analysis_group: equal, lower, higher. 
# If you choose "equal" and "lower", the code computes a linear regression model to see
# whether consumers with budget equal to restaurant price have similar rating to consumers
# with budget lower than the restaurant price. 
# 
# Usage: Rscript analysis.R dataset analysis_group1 analysis_group2 output_file
#
# Arguments: 
# dataset: path and file name for dataset you want to analyze
# analysis_group1, analysis_group2: choose from "equal", "lower", or "higher" depending on your hypothesis
# output_file: path to and name of output file that contains analysis results. 
#
# Example: 
# Rscript analysis.R "../data/data_for_analysis/budget_price_rating.csv" "lower" "higher" "../reports/lower_higher_regression.csv"


