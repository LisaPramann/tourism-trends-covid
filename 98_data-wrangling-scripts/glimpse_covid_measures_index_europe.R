#Explore Covid Data for Chart on toursim from our World in Data 
#https://ourworldindata.org/grapher/covid-stringency-index?time=2020-10-28&region=Europe

library(foreign)
library(tidyverse)
library(lubridate)

Europe_iso <- c("AUT", "BEL", "BGR", "HRV", "HUN", "LVA", "FRA", "FIN", "GRC", "CYP",
                "DNK", "CZE", "EST", "DEU","ESP","ROU", "NLD", "POL", "PRT", "IRL", 
                "LTU", "LUX", "ITA", "MLT", "SWE", "SVN", "SVK")

data_covid_measures <- read.csv("./99_data-sets-raw/covid-stringency-index.csv") %>% 
  filter(Code == Europe_iso) %>%
  mutate(Month = format(ymd(Day), "%Y-%m")) %>%
  group_by(Month) %>% 
  summarize(mean_month_measures = mean(stringency_index)) %>%
  arrange(Month) %>%
  mutate(Month = lubridate::ym(Month))
 
data_covid_cases <-  read.csv("./99_data-sets-raw/owid-covid-data.csv") %>% 
  filter(iso_code == Europe_iso) %>%
  mutate(Month = format(ymd(date), "%Y-%m")) %>%
  group_by(Month) %>% 
  summarize(mean_month_cases = mean(new_cases_per_million)) %>%
  arrange(Month) %>%
  mutate(Month = lubridate::ym(Month))


#Join the two data sets of from our Wold in data to create Covid statistics 
covid_stats <- left_join( 
  data_covid_measures, data_covid_cases)

# Run source("98_data-wrangling-scripts/glimpse_covid_measures_index_europe.R") in the file you want to import the clean data to.

  