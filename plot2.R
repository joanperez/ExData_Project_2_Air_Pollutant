##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
######### Question 2 - Plot2
##################################################################

## This first line will likely take a few seconds. Be patient!

if(!exists("NEI")){ 
  NEI <- readRDS("./AirPollutant/summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("./AirPollutant/Source_Classification_Code.rds") 
} 

### Have total emissions from PM2.5 decreased in the Baltimore City, 
### Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
### system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ] 


aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum) 
 

png('./AirPollutant/plot2.png') 
barplot(
  height=aggregatedTotalByYear$Emissions,
  names.arg=aggregatedTotalByYear$year,
  xlab="Years",
  ylab=expression('Total PM'[2.5]*' Emissions (Tons)'),
  main=expression('Total PM'[2.5]*' In The Baltimore City, MD - Emissions at Various Years')
) 
dev.off() 
