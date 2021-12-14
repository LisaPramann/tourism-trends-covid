#Getting Geo-Data 
#Extract Europe from spatial data. We used data from giscoR here. 

library(sf)
library(sp)
library(rgeos)
library(grid)
#install.packages("giscoR")
#install.packages("gifski")
library(gifski)
library(giscoR)



europe_countries  <- gisco_get_countries(region = c("EU"), resolution = "3",
                                         year = "2020",
                                         epsg = "3035",)

europe_region = st_bbox(c(xmin = 2377294, xmax = 6453440,
                          ymin = 1313597, ymax = 5628510))