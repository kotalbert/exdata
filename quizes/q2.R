# Exploratory Data Analysis
# Quiz 2

library(ggplot2)

# q1
p1 <- xyplot(hwy ~ displ, data=mpg)
class(p1)

# q2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

# q3
xyplot(weight ~ Time | Diet, BodyWeight)

# q7
library(datasets)
data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

# q7
qplot(votes, rating, data = movies) + geom_smooth()
