# Exploratory Data Analysis: Course Project 2
# Plot 2: Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008?

# Get the data for plotting
# Data stored in smry and scc data frames
source("./getdata.R")

# Filter data for Baltimore City
balt <- subset(smry, fips == "24510")

# Create factor for each year indicator
balt$year <- factor(balt$year)
# apply log10 to Emissions, add 1e-3 to remove zeros
balt$log10_emis <- log10(balt$Emissions + 0.001)

# Using palette to color the boxplots
library(RColorBrewer)

png("./figures/plot2.png")
boxplot(log10_emis ~ year, data=balt,  col=brewer.pal(4,"BrBG"), 
        xlab = "Observation year", ylab = expression(paste(log[10],"(Emmisions+1e-3)")), 
        main="Change in overall emissions from all sources in Baltimore City")
dev.off()
