# Exploratory Data Analysis: Course Project 2
Pawel Daniluk
2016-10-24

## Data

The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with
all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, 
the table contains number of tons of PM2.5 emitted from a specific type of 
source for the entire year. Data is available for download [here]( 
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip).

### Data Columns:

* fips: A five-digit number (represented as a string) indicating the U.S. county

* SCC: The name of the source as indicated by a digit string (see source code classification table)

* Pollutant: A string indicating the pollutant

* Emissions: Amount of PM2.5 emitted, in tons

* type: The type of source (point, non-point, on-road, or non-road)

* year: The year of emissions recorded

## Repository description

| Name| Description|
|---|---|
|getdata.R|Getting and transforming data for the graphs. |
|plot1.R| Plot describing change in total PM2.5 emissions in the United States from 2999 to 2008|
|plot2.R|description|
|plot3.R|description|
|plot4.R|description|
|plot5.R|description|
|plot6.R|description|
|figures/|Assignment figures, saved as png images|
|pm25.zip | Compressed data to be used in assignment |
| | |
