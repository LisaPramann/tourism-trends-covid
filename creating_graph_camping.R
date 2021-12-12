
pacman::p_load(foreign, tidyverse, readxl, ggplot2, ggridges)


source("98_data-wrangling-scripts/glimpse_eurostat_data.R")


sum_dom_camp_long = pivot_longer(summer_domestic_camping_perc, !States, names_to = "date", values_to = "value")

camp_dom_long = pivot_longer(eurostat_domestic_camping_percent, !States, names_to = "date", values_to = "value")


sum_dom_camp_long %>% 
  group_by(States) %>% 
  mutate("average" = sum(value) / 4) %>% 
  subset(States != "Euro area") %>% 
  subset(States != "European Union - 27 countries (from 2020)") %>%
  subset(States != "European Union - 28 countries (2013-2020)") %>%
  subset(States != "Malta") %>%
  ggplot(aes(x = States, y = average, fill = average)) +
  geom_col() +
  coord_flip()+
  scale_fill_viridis_c(option = "mako")+
  theme_bw()
