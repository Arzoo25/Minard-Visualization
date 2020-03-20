install.packages("scales")
install.packages("gridExtra")
install.packages("HistData")
install.packages("ggrepel")
install.packages("ggplot2")
install.packages("ggmap")
install.packages("readxl")
library(scales)
library(gridExtra)
library(HistData)
library(ggrepel)
library(ggplot2)
library(ggmap)
library(readxl)

armyInfo <- read_excel("C:/Users/Arzoo/Desktop/Data Visualization/A1.2/troops.xlsx")
cityInfo <- read_excel("C:/Users/Arzoo/Desktop/Data Visualization/A1.2/city.xlsx")
temperatureInfo <- read_excel("C:/Users/Arzoo/Desktop/Data Visualization/A1.2/temperature - Copy.xlsx")

# For plotting army path and survivors

ArmyPlot <- ggplot(armyInfo, aes(armyInfo$LONP, armyInfo$LATP)) +
  geom_path(aes(size = armyInfo$SURV, colour = armyInfo$DIR, group = armyInfo$DIV),
            lineend = "round", linejoin = "round") 

#adding scale info and label info to the armyplot
#setting the values of x-axis so that it is similar to temperature

breaks <- c(1, 2, 3) * 10^5 
MinardPlot <- ArmyPlot +
  scale_size("Survivors", range = c(1, 10), 
             breaks = breaks, labels = scales::comma(breaks)) +
  scale_color_manual("Direction", 
                     values = c("#E59866", "black"), 
                     labels=c("Advance", "Retreat")) +
  coord_cartesian(xlim = c(24, 38)) +
  xlab("Longitude") + 
  ylab("Latitude") + 
  ggtitle("Napoleon's March to Russia") +
  theme_gray() +
  theme(legend.position=c(.8, .2), legend.box="horizontal")

MinardPlot

# Temperature plot with longitude and labelling the dates on them of observation
TemperaturePlot <- ggplot(temperatureInfo, aes(temperatureInfo$LONT, temperatureInfo$TEMP)) +
  geom_path(color="#F39C12", size=2.5) +
  geom_point(size=2) +
  geom_text(aes(label=temperatureInfo$DATE),color="#2980B9", size=4.5) +
  xlab("Longitude") + ylab("Temperature") +
  coord_cartesian(xlim = c(24, 38)) + 
  theme_bw()

TemperaturePlot

# the plot for cities alon with the armypath to show there path through the cities

PathEurope <- c(left = 23.5, bottom = 53.4, right = 38.1, top = 56.3)

PathEuropeMap <- get_stamenmap(bbox = PathEurope,zoom = 8 ,
                          maptype = "terrain-lines")

PathPlot <- ggmap(PathEuropeMap) + geom_path(data = armyInfo, aes(x = LONP, y = LATP, group = DIV, 
                                                                      color = DIR, size = SURV),
                                                   lineend = "round") +
  geom_point(data = cityInfo, aes(x = LONC, y = LATC),
             color = "black") +
  geom_text_repel(data = cities, aes(x = LONC, y = LATC, label = CITY),
                  color = "#283747", family = "Open Sans Condensed Bold") +
  scale_size(range = c(0.5, 10)) + 
  
  theme_nothing()


PathPlot
