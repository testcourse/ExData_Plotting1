
library(sqldf);

data <- read.csv.sql("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE,sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"');

data[,1] <- as.Date(data[,1],"%d/%m/%Y");

date_time <- as.POSIXct(strptime(paste(data[,1],data[,2]),format="%Y-%m-%d %H:%M:%S",tz='GMT'));

plot(date_time,data[,3], type='l',xlab="", ylab="Global Active Power(killowatts)");

dev.copy(png,"plot2.png", width=480, height=480);

dev.off();
