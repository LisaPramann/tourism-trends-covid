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
  summarize(Covid_Measures_Index = mean(stringency_index)) %>%
  arrange(Month) %>%
  mutate(Month = lubridate::ym(Month))
 
t <- c("2020-07", "2020-08", "2021-07", "2021-08")

data_covid_measures_nat <- read.csv("./99_data-sets-raw/covid-stringency-index.csv") %>% 
  filter(Code == Europe_iso) %>%
  mutate(Month = format(ymd(Day), "%Y-%m")) %>%
  filter(Month %in% t) %>% 
  group_by(Entity) %>% 
  summarize(Covid_Index_Summer = mean(stringency_index)) %>%
  filter(!Entity == "Cyprus") %>%
  filter(!Entity == "Malta")
  



# Run source("98_data-wrangling-scripts/glimpse_covid_measures_index_europe.R") 
#in the file you want to import the clean data to.

  