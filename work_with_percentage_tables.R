E#urostat Data Set Percentage change compared to 2019
#https://ec.europa.eu/eurostat/databrowser/view/TOUR_OCC_NIM__custom_1695889/default/line?lang=en


library(foreign)
library(tidyverse)
#install.packages("readxl")
library(readxl)
#install.packages("plotly")
library(plotly)
#install.packages("spData")
library(spData)
#install.packages("sf")
library(sf)

#Percentage change compared to 2019
eurostat_total_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))

eurostat_domestic_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))

eurostat_domestic_camping_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-camping-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))

eurostat_total_camping_percent <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total-camping-percentage.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))

--
#First Trends: Generally domestic tourism is the same in July/August 2019 compared to 2020/21 
#for some countries even increasing 
#Domestic Tourists increasingly stayed ad campsites in July/August 2019 compared to 2020/21
  
summer_total_perc <- eurostat_total_percent %>%
  select(c(States, `2020-07`,`2020-08`, `2021-07`, `2021-08`))

summer_domestic_perc <- eurostat_domestic_percent %>%
  select(c(States, `2020-07`,`2020-08`, `2021-07`, `2021-08`))

summer_domestic_camping_perc <- eurostat_domestic_camping_percent %>%
  select(c(States, `2020-07`,`2020-08`, `2021-07`, `2021-08`))

---
#Create Map
#Load packages (see above)

#Get spetial Data 
world_map <- world %>% 
  select(-c(pop, lifeExp, gdpPercap, type, subregion, iso_a2, region_un, area_km2, continent)) 


#Joining it with Dataset

tourism_total <- left_join( 
  summer_total_perc, world_map, 
  by = c("States" = "name_long"))
