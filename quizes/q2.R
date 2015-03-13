# Exploratory Data Analysis
# Quiz 2

library(lattice);


p1 <- xyplot(hwy ~ displ, data=mpg);
class(p1);



library(nlme);

xyplot(weight ~ Time | Diet, BodyWeight);


library(datasets)

data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(votes, rating, data = movies)

qplot(votes, rating, data = movies, smooth = "loess")

qplot(votes, rating, data = movies) + geom_smooth()
