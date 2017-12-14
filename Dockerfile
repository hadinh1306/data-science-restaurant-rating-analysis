# Docker file for data-science-restaurant-rating-analysis
# Ha Dinh, Dec 2017

# use rocker/tidyverse as the base image
FROM rocker/tidyverse

# install ezknitr packages
RUN Rscript -e "intall.packages('ezknitr', repos = 'http://cran.us.r-project.org')"
