#Getting Geo-Data and select the European Countries and Area
#Extract Europe from spatial data. We used data from giscoR here, an API accessing Package to 
#download data from the GISCO (Geographic Information System of the Commission) Eurostat database
#For more information see: https://cran.r-project.org/web/packages/giscoR/index.html



library(sf)
library(sp)
library(rgeos)
library(grid)
#install.packages("giscoR")
#install.packages("gifski")
library(gifski)
library(giscoR)


#Filter geographic data for only EU countries 
europe_countries  <-
  gisco_get_countries(
    region = c("EU"),
    resolution = "3",
    year = "2020",
    epsg = "3035",
  )

#Specifying the European Area Raster 
europe_region = st_bbox(c(
  xmin = 2377294,
  xmax = 6453440,
  ymin = 1313597,
  ymax = 5628510
))

# Run source("98_data-wrangling-scripts/glimpse_geo_data.R") to import the clean data to a script.

