#Understanding the Eurostat Data Set

library(foreign)
library(tidyverse)
#install.packages("readxl")
library(readxl)

eurostat_total <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total.xlsx")
eurostat_domestic <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic.xlsx")
eurostat_foreign <- read_excel("./99_data-sets-raw/Eurostat/eurostat-foreign.xlsx")

eurostat_total_camping <- read_excel("./99_data-sets-raw/Eurostat/eurostat-total-camping.xlsx")
eurostat_domestic_camping <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-camping.xlsx")
eurostat_domestic_hotel <- read_excel("./99_data-sets-raw/Eurostat/eurostat-domestic-hotels.xlsx")