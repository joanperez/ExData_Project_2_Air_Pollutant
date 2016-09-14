##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
######### Question 5 - Plot5
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

### How have emissions from motor vehicle sources changed from 1999-2008
### in Baltimore City?

library(ggplot2)

### Baltimore = 24510, refer to question 2 and plot2.R
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ] 

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum) 
 
 
 
png("./AirPollutant/plot5.png", width=840, height=480,units="px")

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions)) 
g <- g + geom_bar(stat="identity") + 
  xlab("Year") + 
  ylab(expression('Total PM'[2.5]*" Emissions")) + 
  ggtitle('Total Emissions from Motor Vehicle (type = ON-ROAD) in Baltimore City, Maryland from 1999 to 2008') 
print(g) 
dev.off() 