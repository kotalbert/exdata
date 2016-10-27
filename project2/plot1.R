# Exploratory Data Analysis: Course Project 2
# Plot 1: Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? 

# Get the data for plotting
source("./getdata.R")
s <- smry

# Create factor for each year indicator
s$year <- factor(s$year)
# apply log10 to Emissions, add 1e-3 to log for zeros
s$log10_emis <- log10(s$Emissions + 0.001)

# Using palette to color the boxplots
library(RColorBrewer)

png("./figures/plot1.png")
boxplot(log10_emis ~ year, data=s, col=brewer.pal(4,"BrBG"), 
        xlab = "Observation year", ylab = "log10(Emissions+1e-3)", 
        main="Change in overall emissions from all sources")
dev.off()
