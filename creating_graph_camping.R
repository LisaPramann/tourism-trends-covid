
pacman::p_load(foreign, tidyverse, readxl, ggplot2, ggridges, hrbrthemes)


source("98_data-wrangling-scripts/glimpse_eurostat_data.R")


sum_dom_camp_long = pivot_longer(summer_domestic_camping_perc, !States, names_to = "date", values_to = "value")


#version 1
sum_dom_camp_long %>% 
  na.omit() %>% 
  group_by(States) %>% 
  mutate("average" = mean(value)) %>% 
  subset(States != "Euro area") %>% 
  subset(States != "European Union - 27 countries (from 2020)") %>%
  subset(States != "European Union - 28 countries (2013-2020)") %>%
  subset(States != "Malta") %>%
  ggplot(aes(x = States, y = average, fill = average)) +
  geom_col(position = "identity") + #have to specify identity or dodge otherwise it will add all the same average values together per country
  coord_flip()+
  scale_y_continuous(labels = function(x) paste0(x,"%"))+
  scale_fill_viridis_c(option = "mako")+
  labs(x = "Country", y = "Average Change", title = "Summer Camping Rates for 2020/2021 as Compared to 2019", caption = "Note: Cyprus, France, Iceland, Ireland, Switzerland, and UK results are averages of incomplete data.")+
  theme_bw()

#version 2


sum_dom_camp_long %>% 
  na.omit() %>% 
  group_by(States) %>% 
  mutate("average" = mean(value)) %>% 
  filter_at(vars(contains("States")), all_vars(! . %in% c("Euro area","European Union - 27 countries (from 2020)","European Union - 28 countries (2013-2020)","Malta", 
  "United Kingdom","Liechtenstein","Norway", "Switzerland", "Cyprus", "Iceland"))) %>%  
ggplot(mapping = aes(x = reorder(States, -average), y = average, fill = average)) +
  geom_col(position = "identity") + #have to specify identity or dodge otherwise it will add all the same average values together per country
  scale_y_continuous(labels = function(x) paste0(x,"%"))+
  scale_fill_viridis_c(option = "mako", begin = 0.3, end = 0.9)+
  labs(x = "Country", y = "Average Change", caption = "Source: Eurostat, 2021")+
  theme_ipsum() +
  guides(fill=guide_legend(title="Percentage"))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.y = element_text(hjust = 0.5),
        axis.title.x = element_text(hjust = 0.5))

ggsave(file = "graphs/camping_domestic.png", width = 9, height = 5)


#title = "Summer Camping Rates for 2020/2021 as Compared to 2019"  
#caption = "Note: France, Iceland, and Ireland results are averages of incomplete data."
