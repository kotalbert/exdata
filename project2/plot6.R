# Exploratory Data Analysis: Course Project 2
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


# Get the data for plotting
source("./getdata.R")

# Filter data for Baltimore City
cit <- subset(smry, fips %in% c("24510", "06037"))

# Get SCC for motor-related sources
mot_scc <- unique(scc$SCC[grep("^Mobile - On-Road", scc$EI.Sector)])

# Filter data for combustion-related sources
cit_mot <- subset(cit, SCC %in% mot_scc)

# Merge scc with data to form ggplot facets
cit_mot_scc <- merge(cit_mot, data.frame(SCC=scc$SCC, EI.Sector=scc$EI.Sector), by = "SCC")

# Change EI.Sector text to fit on the plot
pat <- "(^Mobile - On-Road )|Diesel|Gasoline"
cit_mot_scc$sect_short <- factor(gsub(pat, "", cit_mot_scc$EI.Sector))

# Function translating fips to county name
get_cnty <- function(fips) {
  if (fips=="24510") {
    c <- "Baltimore" }
  else {
    c <- "Los Angeles" }
  return(factor(c))
}

# Create Baltimore/Los Angeles factor from fips value
cit_mot_scc$cnty <- sapply(cit_mot_scc$fips, get_cnty)

# Create factor for each source
cit_mot_scc$year <- factor(cit_mot_scc$year)

# apply log10 to Emissions, add 1e-3 to log for zeros
cit_mot_scc$log10_emis <- log10(cit_mot_scc$Emissions + 0.001)

library(ggplot2)

png("./figures/plot6.png")
ggplot(data=cit_mot_scc, aes(x=year, y=log10_emis, color=year)) + 
  facet_grid(sect_short~cnty) + 
  labs(x="Observation year", y=expression(paste(log[10],"(Emmisions+1e-3)")),
       title="Change in motor vehicle emissions in Baltimore") + 
  geom_boxplot()
dev.off()
