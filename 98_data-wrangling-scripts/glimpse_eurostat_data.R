#Understanding the Eurostat Data Set
#https://ec.europa.eu/eurostat/databrowser/view/TOUR_OCC_NIM__custom_1695889/default/line?lang=en


library(foreign)
library(tidyverse)
#install.packages("readxl")
library(readxl)

#Percentage change compared to 2019
eurostat_total_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))  %>% 
  mutate_at(c(2:22), as.numeric, round, 2)

eurostat_domestic_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":"))) %>% 
  mutate_at(c(2:22), as.numeric, round, 2)

eurostat_domestic_camping_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-camping-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":"))) %>% 
  mutate_at(c(2:22), as.numeric, round, 2)

eurostat_total_camping_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total-camping-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":"))) %>% 
  mutate_at(c(2:22), as.numeric, round, 2)

#First Trends: Generally domestic tourism is the same in July/August 2019 compared to 2020/21 
#for some countries even increasing 
#Domestic Tourists increasingly stayed ad campsites in July/August 2019 compared to 2020/21
  
summer_total_perc <- eurostat_total_percent %>%
  dplyr::select(c(States, `2020-07`,`2020-08`, `2021-07`, `2021-08`)) 

summer_domestic_perc <- eurostat_domestic_percent %>%
  dplyr::select(c(States, `2020-07`,`2020-08`, `2021-07`, `2021-08`)) 

summer_domestic_camping_perc <- eurostat_domestic_camping_percent %>%
  dplyr::select(c(States, `2020-07`,`2020-08`, `2021-07`, `2021-08`)) 

# Run source("98_data-wrangling-scripts/glimpse_eurostat_data.R") in the file you want to import the clean data to.
