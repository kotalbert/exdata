# Exploratory Data Analysis: Course Project 2
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# Get the data for plotting
source("./getdata.R")

# Filter data for Baltimore City
balt <- subset(smry, fips == "24510")

# Create factor for each source
balt$type <- factor(balt$type)

# Create factor for each year indicator
balt$year <- factor(balt$year)

# apply log10 to Emissions, add 1e-3 to log for zeros
balt$log10_emis <- log10(balt$Emissions + 0.001)

# Using palette to color the boxplots
library(ggplot2)
library(RColorBrewer)

png("./figures/plot3.png")
ggplot(data=balt, aes(x=year, y=log10_emis, color=year)) + 
    facet_grid(.~type) + 
    labs(x="Observation year", y="log10(Emmisions+1e-3)",
         title="Change in overall emissions (Baltimore City) by source type") + 
    geom_boxplot()
dev.off()
