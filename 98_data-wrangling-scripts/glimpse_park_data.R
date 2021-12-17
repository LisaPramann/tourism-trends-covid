#Understanding the World in Data Park Data Set 

library(foreign)
library(tidyverse)

parks <- read.csv("./99_data-sets-raw/change-visitors-parks-covid.csv")

names(parks) <- c('countries', 'iso', 'Days', 'parks')

eurocountries <- c("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czechia", "Denmark", "Estonia", "Finland", "France",
                   "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherland",
                   "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden")

eu_parks <- parks %>%
  filter(countries %in% eurocountries)


