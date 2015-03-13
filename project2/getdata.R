# Exploratory Data Analysis: Course Project 2
# Getting and transforming data.

# Downloading file

url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip";
target.file = "data/pm25.zip";

download.file(url, target.file);

# Unziping file
unzip(zipfile = target.file, exdir = "data");

# Reading data into data frames

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Boxplot of MPG by Car Cylinders 
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

