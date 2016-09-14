##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
######### Question 1 - Plot1
##################################################################

## This first line will likely take a few seconds. Be patient!

if(!exists("NEI")){ 
 NEI <- readRDS("./AirPollutant/summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
   SCC <- readRDS("./AirPollutant/Source_Classification_Code.rds") 
 } 

### Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
### Using the base plotting system, make a plot showing the total PM2.5 emission from 
### all sources for each of the years 1999, 2002, 2005, and 2008.
 

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum) 
 

png('./AirPollutant/plot1.png') 

barplot(
  (aggregatedTotalByYear$Emissions)/10^6,
  names.arg=aggregatedTotalByYear$year,
  xlab="Years",
  ylab=expression('Total PM'[2.5]*' Emissions (10^6 Tons)'),
  main=expression('Total PM'[2.5]*' Emissions At Various Years')
)
dev.off() 
