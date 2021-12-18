
#title: "creating_graph_dom_tourism"
#author: "Lisa Pramann"
#date: "12/14/2021"

#Load libraries and datasets from separate script 

library(tidyverse)
library(hrbrthemes)
library(viridis)
source("./98_data-wrangling-scripts/glimpse_eurostat_data.R")


#Creating a graph showing Europe's domestic tourism stays compared to 2019 for the summer 2020/2021.
#First, mutate the data set accordingly to be able to create the average value 

sum_dom_long = pivot_longer(summer_domestic_perc, !States, names_to = "date", values_to = "value")

#creating a barplot with ggplot
sum_dom_long %>% 
  na.omit() %>% 
  group_by(States) %>% 
  mutate("average" = mean(value)) %>% 
  filter_at(vars(contains("States")), all_vars(! . %in% c("Euro area","European Union - 27 countries (from 2020)","European Union - 28 countries (2013-2020)","Malta", 
  "United Kingdom","Liechtenstein","Norway", "Switzerland", "Cyprus", "Iceland"))) %>%  
  ggplot(mapping = aes(
    x = reorder(States,-average),
    y = average,
    fill = average
  )) +
  geom_col(position = "identity") + 
  #have to specify identity or dodge otherwise it will add all the same average values together per country
  scale_y_continuous(
    breaks = c(-25, 0, 50, 100),
    labels = function(x)
      paste0(x, "%")
  ) +
  #specify the layout and design
  scale_fill_viridis_c(option = "mako",
                       begin = 0.3,
                       end = 0.9) +
  labs(x = "Country", y = "Average Change", caption = "Source: Eurostat, 2021") +
  theme_ipsum() +
  guides(fill = guide_legend (title = "Percentage")) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title.y = element_text(hjust = 0.5),
    axis.title.x = element_text(hjust = 0.5)
  )


ggsave(file = "./graphs/tourism_summer_domestic.png", width = 9, height = 5)

# title = "Domestic tourist stays in the Summer 2020/2021 as compared to 2019", caption = "Note: France, Iceland, and Ireland results are averages of incomplete data.")