


library(tidyverse)
library(hrbrthemes)
library(viridis)
library(lubridate)
library(magick)
library(plotly)



source("./98_data-wrangling-scripts/glimpse_park_data.R")


eu_parks_mean <- eu_parks %>%
  group_by(Days) %>%
  summarize(Visits = mean(parks)) %>%
  mutate_at(2, round, 2) %>%
  mutate(Days = lubridate::ymd(Days))



freq_parks_visit <- eu_parks_mean %>%
  ggplot(aes (x = Days, y = Visits)) +
  geom_line(size = 1.1, color = "#404788FF") +
  geom_area(fill = "#20A387FF", alpha = 0.5) +
  scale_y_continuous(
    limits = c(-40, 175),
    breaks = c(-25, 0, 25, 50, 75, 100, 125, 150),
    labels = function(x)
      paste0(x, "%"),
    name = "Average Change of Visits"
  ) +
  scale_x_date(
    limits = as.Date(c("2020-03-01", "2021-09-01")),
    date_breaks = "2 month",
    date_minor_breaks = "month",
    date_labels = "%m-%Y",
    name = "Months of the Pandemic (March 2020 - September 2021)"
  ) +
  theme_minimal() +
  theme(
    axis.title.x = element_text(margin = margin(t = 15), size = 10),
    axis.title.y = element_text(size = 10),
  ) +
  labs(caption = "Source: Our World in Data, 2021")



#ggsave(freq_parks_visit, file = "graphs/freq_parks_visit.png", width = 9, height = 5)

#title = "Frequency of Park Visits in numbers"
#subtitle = "Change relative to the period before the Pandemic",



#Making the Graph of Park visits interactive (done in Markdown)

interact_visits <- ggplotly(freq_parks_visit)
interact_visits






