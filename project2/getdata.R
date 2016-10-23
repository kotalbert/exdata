# Exploratory Data Analysis: Course Project 2
# Getting and transforming data.

# Downloading and decompressing files
# Only if zip file not present in data directory

if (!file.exists("./pm25.zip")) {
    message("Files not present. Downloading and decompressing")
    u <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(u, "./pm25.zip")
    unzip(zipfile="./pm25.zip")
    message("Files downloaded and decompressed")
} else
    message("Files present in working directory")

# Check if files already in memory. If not read files as data frames.
if (!exists("smry")) {
    message("reading summarySCC_PM25.rds")
    smry <- readRDS("./summarySCC_PM25.rds")
}

if (!exists("scc")) {
    message("reading Source_Classification_Code.rds")
    scc <- readRDS("./Source_Classification_Code.rds")
}
