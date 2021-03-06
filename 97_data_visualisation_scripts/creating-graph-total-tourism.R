

#author: "Lisa Pramann"
#date: "12/14/2021"

#Load libraries and datasets from separate script as well as the geo-data

library(tidyverse)
library(hrbrthemes)
library(viridis) # design choice for all graphs
source("./98_data-wrangling-scripts/glimpse_eurostat_data.R")
source("./98_data-wrangling-scripts/glimpse_covid_measures_index_europe.R") 


#Mutating data sets  


#glimpse(eurostat_total_percent)

#mutate data accordingly to get months in one column 
tourism_total_graph <- eurostat_total_percent %>%
  pivot_longer(., cols = 2:22,
               names_to = "year",
               values_to = "tourist_stays_percent") %>%
  filter(States == "European Union - 27 countries (from 2020)") %>%
  mutate(Month = lubridate::ym(year)) %>%
  arrange(Month) 

#glimpse(tourism_total_graph)
#glimpse(data_covid_measures)

#Join data-frames and filter Jan/Feb 2020 to only get the pandemic-time-series
tourism_total_graph_02 <- left_join(tourism_total_graph, data_covid_measures) %>%
  filter(!year == c("2020-01", "2020-02"))



#Creating the graph for the development of Europe's total tourism compared to 2019. 
#Adding a geom_line for the stringency of Covid-response measures to the graph 
#It is reasonable to put them in one plot, because one variable is scaled in percent and the other variable as a Index (0-100). 

l <- tourism_total_graph_02 %>%
  ggplot(aes(x = Month)) +
  geom_line(aes(y = tourist_stays_percent),
            color = "#404788FF",
            size = 1.1) +
  #add second line 
  geom_line(aes(y = Covid_Measures_Index),
            color = "#20A387FF",
            size = 1.1) +
  scale_y_continuous(
    limits = c(-100, 100),
    breaks = c(-100,-75,-50,-25, 0),
    minor_breaks = c(25, 50, 75, 100),
    labels = function(x)
      paste0(x, "%"),
    name = "Change in Tourist Stays",
    #add second y axis
    sec.axis = sec_axis( ~ ., name = "Covid Response Measures (Index 0-100)",
                         breaks = c(0, 20, 40, 60, 80, 100))
  ) +
  scale_x_date(
    limits = as.Date(c("2020-03-01", "2021-09-01")),
    date_breaks = "2 month",
    date_minor_breaks = "month",
    date_labels = "%m-%Y"
  ) +
  #adjust layout and design
  xlab("Months of the Pandemic (March 2020 - September 2021)") +
  labs(caption = "Source: Eurostat, 2021; Our World in Data, 2021") +
  theme_ipsum() +
  theme(
    axis.title.x = element_text(margin = margin(t = 20), hjust = 0.5),
    axis.title.y = element_text(color = "#404788FF", hjust = 0.5),
    axis.title.y.right = element_text(color = "#20A387FF", hjust = 0.5)
  )

  
ggsave(l,file = "./graphs/tourism_covid_measures.png", width = 9, height = 5)

# ggtitle("Development of Tourist Overnight Stays in Europe and Covid-19 Restrictions") +



#Creating a graph showing Europe's total tourism stays compared to 2019 for the summer 2020/2021.

#First, mutate the data set accordingly 
sum_long <- pivot_longer(summer_total_perc, !States, names_to = "date", values_to = "value")

#creating the plot 

n <- sum_long %>%
  na.omit() %>%
  group_by(States) %>%
  mutate("average" = mean(value)) %>% 
  filter_at(vars(contains("States")), all_vars(! . %in% c("Euro area","European Union - 27 countries (from 2020)","European Union - 28 countries (2013-2020)","Malta", "United Kingdom","Liechtenstein","Norway", "Switzerland", "Cyprus", "Iceland"))) %>%  
  ggplot(mapping = aes(
    x = reorder(States,-average),
    y = average,
    fill = average
  )) +
  geom_col(position = "identity") + 
  #have to specify identity or dodge otherwise it will add all the same average values together per country
  scale_y_continuous(
    breaks = c(-50,-25, 0, 25),
    labels = function(x)
      paste0(x, "%")
  ) +
  #adjust the layout and design
  scale_fill_viridis_c(option = "mako",
                       begin = 0.3,
                       end = 0.9) +
  labs(x = "Country", y = "Average Change", caption = "Source: Eurostat, 2021") +
  theme_ipsum() +
  guides(fill = guide_legend(title = "Percentage", size = 12)) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y = element_text(size = 12),
    axis.title.y = element_text(hjust = 0.5, size = 12),
    axis.title.x = element_text(hjust = 0.5, size = 12),
    plot.caption = element_text(size = 12)
  )


ggsave(n, file = "./graphs/tourism_summer_total.png", width = 9, height = 5)


#Save order of states as in *n* for comparing graphs

order <- sum_long %>% 
  na.omit() %>% 
  group_by(States) %>% 
  mutate(average = mean(value)) %>% 
  filter_at(vars(contains("States")), all_vars(! . %in% c("Euro area","European Union - 27 countries (from 2020)","European Union - 28 countries (2013-2020)","Malta", "United Kingdom","Liechtenstein","Norway", "Switzerland", "Cyprus", "Iceland"))) %>%  
  arrange(desc(average)) %>%
  distinct(States)



#Creating a graph showing the average of Europe's stringency of Covid 
#response measures for the summer 2020/2021


#Join data sets to be able to have the same order as the countries in plot n 

graph_measures_summer <- left_join(order, data_covid_measures_nat, by = c("States" = "Entity"))
graph_measures_summer$States  <- factor(graph_measures_summer$States, levels = graph_measures_summer$States)

m <- graph_measures_summer %>%
  ggplot(mapping = aes(x = States,
                       y = Covid_Index_Summer, fill = Covid_Index_Summer)) +
  geom_col(position = "identity") +
  #have to specify identity or dodge otherwise it will add all the same average values together per country
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100)) +
  scale_fill_viridis_c(
    option = "mako",
    begin = 0.3,
    end = 0.9,
    direction = 1
  ) +
  #adjistung the layout and design
  labs(x = "Country", y = "Index Covid Response Measures", caption = "Source: Our World in Data, 2021") +
  theme_ipsum() +
  guides(fill = guide_legend(title = "Index (0-100)")) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y = element_text(size = 12),
    axis.title.y = element_text(hjust = 0.5, size = 12),
    axis.title.x = element_text(hjust = 0.5, size = 12),
    plot.caption = element_text(size = 12)
  )

ggsave(m, file = "./graphs/summer_covid_measures.png", width = 9, height = 5)
  
#title = "Covid Measures Average in the Summer 2020/2021"