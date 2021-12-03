#Understanding the Eurostat Data Set
#https://ec.europa.eu/eurostat/databrowser/view/TOUR_OCC_NIM__custom_1695889/default/line?lang=en


library(foreign)
library(tidyverse)
#install.packages("readxl")
library(readxl)

eurostat_total <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":"))) 
eurostat_domestic <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic.xlsx")%>%
  mutate(across(where(is.character), ~na_if(., ":")))
eurostat_foreign <- read_excel("./99_data-sets-raw/Eurostat/eurostat-foreign.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))

eurostat_total_camping <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total-camping.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))
eurostat_domestic_camping <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-camping.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))
eurostat_domestic_hotel <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-hotels.xlsx") %>%
  mutate(across(where(is.character), ~na_if(., ":")))

---

#First Trends: Generally domestic tourism is the same in July/August 2019 compared to 2020/21 for some countries even increasing 
#Domestic Tourists increasingly stayed ad campsites in July/August 2019 compared to 2020/21

summer_total <- eurostat_total %>%
select(c(States,`2019-07`,`2019-08`, `2020-07`,`2020-08`, `2021-07`, `2021-08`))

#In total we are not yet there compared to 2019 but in many countries better than in 2020 
#(and certainly not as worse as UNWTO suggests for Europe https://www.unwto.org/international-tourism-and-covid-19)

summer_domestic <- eurostat_domestic %>%
  select(c(States,`2019-07`,`2019-08`, `2020-07`,`2020-08`, `2021-07`, `2021-08`))


summer_domestic_camping <- eurostat_domestic_camping %>%
  select(c(States,`2019-07`,`2019-08`, `2020-07`,`2020-08`, `2021-07`, `2021-08`))

