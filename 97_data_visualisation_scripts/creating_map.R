#author: "Lisa Pramann"
#date: "12/14/2021"

#Import libraries and source scripts

library(tidyverse)
library(sf) # necessary to work with spatial data
library(sp) # necessary to work with spatial data
library(tmap) # for designing fancy maps
library(viridis) # design choice for all graphs
library(magick) # needed for animation

#Importing wrangled data-sets
source("./98_data-wrangling-scripts/glimpse_eurostat_data.R")
#Get shape-files from Geo-Data script
source("./98_data-wrangling-scripts/glimpse_geo_data.R")



#Create interactive map for percentage change in total number of tourism 
#(over the months of the pandemic)



#Join with spatial data
tourism_total_02 <- left_join(europe_countries,
                              eurostat_total_percent,
                              by = c("NAME_ENGL" = "States"))

#glimpse(tourism_total_02)

#Manipulating dataset to have all months in one column (condition for time-series map)
tourism_total_02.1 <- tourism_total_02 %>%
  select(-c(`2020-01`, `2020-02`)) %>%
  pivot_longer(.,
               cols = 6:24,
               names_to = "year",
               values_to = "tourist_stays")


#Design the actual map with tmap()
europe_animation_02 <-
  tm_shape(tourism_total_02.1, bbox = europe_region) +
  #prior specified Area for Europe 
  tm_polygons(
    col = "tourist_stays",
    border.col = "white",
    pal = viridis(
      10,
      option = "mako",
      begin = 0.3,
      end = 1,
      direction = 1
    ),
    midpoint = NA,
    #Important to make use of the full palette 
    border.alpha = 0.5,
    breaks = c(-100,-75, -50, -25, 0, 25, 50),
    labels = c("-100%", "-75%", "-50%", "-25%","0%","25%"),
    title = "Tourist Stays"
  ) +
  #adjust layout and design 
  tm_legend(legend.position = c("right", "bottom")) +
  tm_layout(
    title.position = c("left", "top"),
    legend.position = c("RIGHT", "TOP"),
    legend.text.size = 1.6,
    legend.title.size = 1.9,
    frame = FALSE
  ) +
  #creating a map for each facet
  tm_facets(along = "year")

#Making the series of maps animated 
tmap_animation(
  europe_animation_02, filename = "./graphs/tourism_total_2020_2021.gif", width = 1700, height = 1500,
  delay = 150
)

#title = "Stays at Tourist Accomendations in Europe ",
#tm_layout( title.size = 2.5,