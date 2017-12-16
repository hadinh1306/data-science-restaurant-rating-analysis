# Docker file for data-science-restaurant-rating-analysis
# Ha Dinh, Dec 2017

# use rocker/tidyverse as the base image
FROM rocker/tidyverse

# install required packages for analysis pipeline
## install package `forcats` for `clean_data.R`
RUN Rscript -e "install.packages('forcats', repos = 'http://cran.us.r-project.org')"

## install package `broom` for `regression_analysis.R`
RUN Rscript -e "install.packages('broom', repos = 'http://cran.us.r-project.org')"

## install package `packrat` for reproducible project management
RUN Rscript -e "install.packages('packrat', repos = 'http://cran.us.r-project.org')"

# install ezknitr packages to output analysis report
RUN Rscript -e "intall.packages('ezknitr', repos = 'http://cran.us.r-project.org')"
