
library(sqldf);

data <- read.csv.sql("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE,sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"');

hist(data[,3],main='Global Active Power', xlab='Global Active Power(kilowatts)',ylab='Frequency', col='red');

dev.copy(png,"plot1.png", width=480, height=480);

dev.off();
