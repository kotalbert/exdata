# Exploratory Data Analysis: Course Project 2
# Plot 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 


# Reading data into data frames 
# if they are not in memory

 if (!exists("NEI")) {
   NEI <- readRDS("data/summarySCC_PM25.rds");
 }
 

 if (!exists("SCC")) {
   SCC <- readRDS("data/Source_Classification_Code.rds");
 }

#Using dplyr package to transform the data frame
library(dplyr);
 
NEI.tbl <- tbl_df(NEI);
str(NEI.tbl) 
browseVignettes(package = "dplyr")

# using dplyr chaining for data transformation
 
NEI.plot1 <- NEI.tbl %>%
   
   # selectiong only relevant data
   select(year, Emissions) %>%
   
   # Grouping by year variable
   group_by(year) %>%
   
   # calculation statistics for reuse
   summarise(mean.emissions = mean(Emissions), 
             sd.emissions = sd(Emissions),
             n.emissions = n()) %>%
   
   # calculation confidence interval for the sample
   # http://onlinestatbook.com/2/estimation/mean.html
   mutate(sd.sample = sd.emissions/sqrt(n.emissions),
          ucl95 = mean.emissions + sd.sample* 1.96,
          lcl95 = mean.emissions - sd.sample* 1.96
          );
 
 
# Plotting calculated statistics. 
# Note: I didn't used boxplot funtion on the entire dataset, 
# since the dataset is to big to be efficiently plotted. 
# I'm calculating and ploting my own statistics instad 
 
 png(filename = "graphs/plot1.png");
 
# Plot canvas 
plot(x=NEI.plot1$year, y=NEI.plot1$mean.emissions, 
    type = "n",
    ylab = "Emissions", xlab = "Year",
    main = "Emissions by Year");

# Plotting means
 points(x=NEI.plot1$year, y=NEI.plot1$mean.emissions,
        col = "blue", pch = 19);
 
points(x=NEI.plot1$year, y=NEI.plot1$mean.emissions,
       col = "blue", pch = 19, type="l");
 
# Plotting UCL
 points(x=NEI.plot1$year, y=NEI.plot1$ucl95,
        col = "green", pch = 19, type="l",
        lty=3);
 
# Plotting LCL
 points(x=NEI.plot1$year, y=NEI.plot1$lcl95,
        col = "red", pch = 19, type="l",
        lty=3);
 
# Adding legend
legend("topright", 
       legend=c("UCL95", "Mean", "LCL95"),
       col = c("green", "blue", "red"),
       lty = c(3, 1, 3)
       ); 
 
dev.off();