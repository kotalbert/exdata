# Exploratory Data Analysis: Course Project 2
# Plot 5: How have emissions from motor vehicle sources changed from 1999???2008
# in Baltimore City?

# Get the data for plotting
# Data stored in smry and scc data frames
source("./getdata.R")

# Filter data for Baltimore City
balt <- subset(smry, fips == "24510")

# Get SCC for motor-related sources
mot_scc <- unique(scc$SCC[grep("^Mobile - On-Road", scc$EI.Sector)])

# Filter data for moto-related sources
balt_mot <- subset(balt, SCC %in% mot_scc)

# Merge scc with data to form ggplot facets
balt_mot_scc <- merge(balt_mot, data.frame(SCC=scc$SCC, EI.Sector=scc$EI.Sector), by = "SCC")

# Change EI.Sector text to fit on the plot
pat <- "(^Mobile - On-Road )|Diesel|Gasoline"
balt_mot_scc$sect_short <- factor(gsub(pat, "", balt_mot_scc$EI.Sector))

# Function to identify if motor vehicle is diesel or gasoline
get_fuel_type <- function(sector) {
  if (grepl("Diesel", sector)) {f = "Diesel"}
  else {
    f = "Gasoline"}
      return(factor(f))
}

# Create factor Diesel/Gasoline
balt_mot_scc$fuel_type <- sapply(balt_mot_scc$EI.Sector, get_fuel_type)

# Create factor for each year
balt_mot_scc$year <- factor(balt_mot_scc$year)

# apply log10 to Emissions, add 1e-3 to remove zeros
balt_mot_scc$log10_emis <- log10(balt_mot_scc$Emissions + 0.001)

library(ggplot2)

png("./figures/plot5.png")
ggplot(data=balt_mot_scc, aes(x=year, y=log10_emis, color=year)) + 
  facet_grid(sect_short~fuel_type) + 
  labs(x="Observation year", y=expression(paste(log[10],"(Emmisions+1e-3)")),
       title="Change in motor vehicle emissions in Baltimore") + 
  geom_boxplot()
dev.off()
