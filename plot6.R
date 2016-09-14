##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
######### Question 6 - Plot6
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


### Compare emissions from motor vehicle sources in Baltimore City with
### emissions from motor vehicle sources in Los Angeles County, California
### (fips == "06037"). Which city has seen greater changes over time in 
## motor vehicle emissions?


### Baltimore = 24510 and Los Angeles = 06037 
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ] 


aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum) 
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD" 
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA" 
 

png("./AirPollutant/plot6.png", width=1040, height=480,units="px") 

g <- ggplot(aggregatedTotalByYearAndFips, aes(x=factor(year), y=Emissions, fill=fips)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~fips) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore City, MD vs Los Angeles, CA, 1999-2008"))
  
print(g) 
dev.off() 
