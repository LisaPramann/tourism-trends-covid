# How did Europeans Spend Their Summer Holidays? - Exploring the Covid-19 Pandemic’s Impact on European Tourism


## Project Summary

Our **data journalism piece** evaluates Covid-19’s influence on tourism in Europe. While overall nightly tourist stays declined in the past 2 years, domestic tourism increased for most countries during the summer months. Data shows Europeans didn’t give up their holidays altogether, but instead embraced “staycations”, including increased camping trips and visits to parks. The trend of appreciating the outdoors may linger past the pandemic’s effect. Park visits stayed relatively high in 2021 and more people are being drawn to RV vacations. No matter how the pandemic evolves, it seems Europeans will find a way to adventure, even if it’s not far from home. 

### Autors 

- Renato Franco (ventocillarenato@gmail.com)
- Kathryn Malchow (malchow.kathryn@gmail.com)
- Lisa Pramann (lisa.pramann@gmail.com)


### Approach to the Project 

For the realization of the final data project we decided to look at the trends in tourism during the Covid-19 pandemic. First we looked at data and the dashboard from the World Tourism Organisation on international tourism and tried to get some flights data. However, it was too difficult to get the data in time. Moreover, the impact of pandemic counter measures varied across different continents which would have made interpretation difficult. That is why we focused on Europe, mainly using publicly available data on tourism from *Eurostat* and complemented by Index data on pandemic counter-measures and movement data from *Our World in Data*. Data downloaded from Eurostat were already slightly adjusted in excel format before they were imported. After we identifying some general trends, we first visualised them and then told our story around our findings. 


## Contribution Statement:

- *Lisa Pramann* set up the project workflow, created the map, the graphs and the story around the overall number of tourism in Europe (time-series and summer months) in relation to the stringency of countermeasures and the the pandemic's impact on European domestic tourism. 

- *Kathryn Malchow* created the Readme, worked on the visualization of camping rates and build that argument into the article and did the layout of the latter.

- *Renato Franco* analysed the frequency of park visits in Europe over the last months included it in the text and build a fine story around our arguments. 


### Project Limitations 

The data used  and the findings of our project have some limitations: 

- The Eurostat *tourism data* is still missing some values from France, Cyprus, Ireland, Greece and Bulgaria for some months, especially in the second half of 2021. When significant for the calculation of average values, we indicated this in our report. 
- Our World in Data is providing a helpful *index of the stringency of Covid-19 response measures* including nine metrics (e.g. school closures,  stay-at-home requirements). It is however not entirely clear the index calculated. Please visit their [website](https://ourworldindata.org/covid-stringency-index) for further information  
- The data for the *frequency in parks visits* from Our World in Data is retrieved from Google Mobility Data compares to baseline days (the median value for the 5‑week period from January 3 to February 6, 2020). This [guidance](https://support.google.com/covid19-mobility/answer/9825414?hl=en&ref_topic=9822927) elaborates on the potential impact of changes in weather and holiday seasons which explains the sharp increase. We find the data for the summer season are nevertheless well comparable and provides an overall picture of people's increased outdoor activities.   
- The data on *tourists' nights spent on camp sites* for Eurostat only supports our argument if, in addition, we filter for domestic tourism. This is mainly due to the decline in international tourism which we hereby acknowledge.


## References 

### Datasets and Packages 


- Eurostat (2021). Nights spent at tourist accommodation establishments - monthly data [Data file]. Retrieved from https://ec.europa.eu/eurostat/web/tourism/data/database 

- Our World in Data (2021). Parks and outdoor spaces [Data file]. Retrieved from https://ourworldindata.org/covid-google-mobility-trends#parks-and-outdoor-spaces

- Our World in Data (2021). Covid-19: Stringency Index [Data file]. Retrieved from https://ourworldindata.org/covid-stringency-index#citation

Find our R packages used [here]("~/packages_references.Rmd")


### Further Resources used in the Article 

- Clinch, M. (2017, August 11). 'RV sales soar across Europe and US as people fall back in love with the road trip'. CNBC. https://www.cnbc.com/2017/08/11/rv-sales-soar-across-europe-and-us-as-people-fall-back-in-love-with-the-road-trip.html

- Darko, B. (2021, August 29). 'Croatia thrilled at summer season success despite COVID-19'. AP News. https://apnews.com/article/lifestyle-business-europe-travel-coronavirus-pandemic-d008ced44d6c3f7d162d356e7981ef63

- Dutch News. (2021, August 06). 'Coronavirus boost for caravan and campervan sales'. https://www.dutchnews.nl/news/2021/08/coronavirus-boost-for-caravan-and-camper-van-sales/

- Ellyatt, H. (2020, May 27). 'La dolce vita? Italians embrace their freedom but crowded beaches and nightlife worry officials'. CNBC. https://www.cnbc.com/2020/05/27/italians-crowd-beaches-and-piazzas-worrying-officials-after-lockdown.html

- Guillou, C. (2021, December 17). 'La grande offensive des villes contre Airbnb'. Le Monde. https://www.lemonde.fr/economie/article/2021/12/17/la-grande-offensive-des-villes-contre-airbnb_6106394_3234.html

- International Energy Agency. (2021, March 02). 'Global Energy Review: CO2 Emissions in 2020'. https://www.iea.org/articles/global-energy-review-co2-emissions-in-2020

- Lincoln Institute for Land Policy. (2020, October 07). 'The Pandemic Has Underscored the Need for More Urban Parks. So What Comes Next?'. https://www.lincolninst.edu/publications/articles/2020-10-room-roam-pandemic-urban-parks-what-comes-next

- Mitteldeutsche Rundfunk. (2021, August 17). 'MDRfragt zum Sommerurlaub 2021: Mehrheit macht Urlaub in Deutschland'. https://www.mdr.de/nachrichten/deutschland/panorama/mdrfragt-umfrage-ergebnis-sommerurlaub-mehrheit-bleibt-in-deutschland-100.html

- Smith, H. (2021, June 12). 'Americans are heaven for us’: the surge in US visitors throwing Greece a lifeline'. The Guardian. https://www.theguardian.com/world/2021/jun/12/americans-are-heaven-for-us-a-surge-in-us-visitors-throws-greece-a-lifeline

- Spiegel (2021, August 18). 'Germans are buying even more campers than in 2020'. https://www-spiegel-de.translate.goog/wirtschaft/service/reisemobile-in-der-corona-krise-deutsche-kaufen-noch-mehr-camper-als-2020-a-9b091197-c7d2-48e0-86b5-2d6bba6900ea?_x_tr_sl=de&_x_tr_tl=en&_x_tr_hl=de

- The Economist (2021, February 11). 'Shelters fear an influx of no-longer-wanted lockdown pets'. https://www.economist.com/europe/2021/02/13/shelters-fear-an-influx-of-no-longer-wanted-lockdown-pets

- World Tourism Organization. (2021). 'International Tourism and covid-19'. https://www.unwto.org/international-tourism-and-covid-19

- World Travel & Tourism Council (2021). 'Economic Impact Reports'. https://wttc.org/Research/Economic-Impact

### License

This repository provides the materials the the final Data Project that was created as part of the course [Introduction to Data Science](https://github.com/intro-to-data-science-21) taught by Simon Munzert at the Hertie School, Berlin, in Fall 2021.

The material in this repository is made available under the [MIT license](http://opensource.org/licenses/mit-license.php). 
