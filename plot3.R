##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
######### Question 3 - Plot3
##################################################################

## This first line will likely take a few seconds. Be patient!

if(!exists("NEI")){ 
  NEI <- readRDS("./AirPollutant/summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("./AirPollutant/Source_Classification_Code.rds") 
} 

### Of the four types of sources indicated by the type (point, nonpoint, 
### onroad, nonroad) variable, which of these four sources have seen 
### decreases in emissions from 1999-2008 for Baltimore City? Which have
### seen increases in emissions from 1999-2008? Use the ggplot2 plotting
### system to make a plot answer this question.

library(ggplot2)

### Baltimore = 24510, refer to question 2 and plot2.R
subsetNEI  <- NEI[NEI$fips=="24510", ] 

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year, subsetNEI, sum) 


png("./AirPollutant/plot3.png", width=640, height=480,units="px")

g <- ggplot(subsetNEI, aes(factor(year), Emissions, fill = type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City, Maryland, 1999-2008 by Source Type"))
  
print(g) 
dev.off() 
