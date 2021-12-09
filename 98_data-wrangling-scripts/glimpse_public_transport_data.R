#Understanding the World in Data Public Transport Data Set 

library(foreign)
library(tidyverse)

data_public_transport <- read.csv("./99_data-sets-raw/visitors-transit-covid-2-raw.csv")

#Problem: number of visitors to transit stations has changed compared to baseline days 
#(the median value for the 5‑week period from January 3 to February 6, 2020).
#This includes public transport hubs such as subway, bus, and train stations.
#This index is smoothed to the rolling 7-day average.(the median value for the 
#5‑week period from January 3 to February 6, 2020).
#Question: Can we change that? https://ourworldindata.org/covid-google-mobility-trends 