#Understanding the World in Data Park Data Set 

library(foreign)
library(tidyverse)

data_parks <- read.csv("./99_data-sets-raw/change-visitors-parks-covid-raw.csv")

#Problem: Data shows how the number of visitors to parks and outdoor spaces has changed compared 
#to baseline days (the median value for the 5‑week period from January 3 to February 6, 2020).
#Question: Can we change that? https://ourworldindata.org/covid-google-mobility-trends 