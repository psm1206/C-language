setwd("C:/practice")
install.packages("ggiraphExtra")
library(ggiraphExtra)
str(USArrests)
head(USArrests)
library(tibble)

crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)
str(crime)

library(ggplot2)
install.packages("maps")
library(maps)
install.packages("mapproj")
library(mapproj)
states_map <- map_data("state")

ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map)

ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map,
             interactive = T)
