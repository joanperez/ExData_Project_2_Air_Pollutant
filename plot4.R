##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
######### Question 4 - Plot4
##################################################################

## This first line will likely take a few seconds. Be patient!

if(!exists("NEI")){ 
  NEI <- readRDS("./AirPollutant/summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("./AirPollutant/Source_Classification_Code.rds") 
} 

## Merge the NEI and SCC Dataset  
if(!exists("NEISCC")){ 
  NEISCC <- merge(NEI, SCC, by="SCC") 
} 


### Across the United States, how have emissions from coal 
### combustion-related sources changed from 1999-2008?

library(ggplot2)

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE) 
subsetNEISCC <- NEISCC[coalMatches, ] 
 

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum) 
 
 

 

png("./AirPollutant/plot4.png", width=640, height=480,units="px")

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions/10^5)) 
g <- g + geom_bar(stat="identity") + 
  xlab("Year") + 
  ylab(expression('Total PM'[2.5]*" Emissions (10^5 Tons)")) + 
  ggtitle('Total Emissions from Coal Sources from 1999 to 2008') 
print(g) 
dev.off() 
