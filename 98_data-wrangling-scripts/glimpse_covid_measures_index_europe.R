#Explore Covid Data for Chart on toursim from our World in Data 
#https://ourworldindata.org/grapher/covid-stringency-index?time=2020-10-28&region=Europe

library(foreign)
library(tidyverse)
library(lubridate)

Europe_iso <- c("AUT", "BEL", "BGR", "HRV", "HUN", "LVA", "FRA", "FIN", "GRC", "CYP",
                "DNK", "CZE", "EST", "DEU","ESP","ROU", "NLD", "POL", "PRT", "IRL", 
                "LTU", "LUX", "ITA", "MLT", "SWE", "SVN", "SVK")

data_covid_measures_raw <- read.csv("./99_data-sets-raw/covid-stringency-index.csv") %>% 
  filter(Code == Europe_iso)
 
data_covid_measures <- data_covid_measures_raw %>%
  mutate(Month = format(ymd(Day), "%Y-%m")) %>%
  group_by(Month) %>% 
  summarize(mean_month = mean(stringency_index)) %>%
  arrange(Month) %>%
  mutate(Month = lubridate::ym(Month))

# Run source("98_data-wrangling-scripts/glimpse_covid_measures_index_europe.R") in the file you want to import the clean data to.
