##################################################################
######### Author: Joan Manuel Perez <joan.perez.cardona@gmail.com>
######### Exploratory Data Analysis - September 2016
######### Environmental Protection Agency (EPA) - Air Pollutant
##################################################################

##################################################################
######### 1. Download the file and put the file in the data folder
##################################################################

if(!file.exists("./AirPollutant")){dir.create("./AirPollutant")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl,destfile="./AirPollutant/exdata%2Fdata%2FNEI_data.zip",method="curl")

##################################################################
######### 2.Unzip the file
##################################################################

unzip(zipfile="./AirPollutant/exdata%2Fdata%2FNEI_data.zip",exdir="./AirPollutant")

