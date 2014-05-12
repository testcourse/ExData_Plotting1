
library(sqldf);

data <- read.csv.sql("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE,sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"');

data[,1] <- as.Date(data[,1],"%d/%m/%Y");

date_time <- as.POSIXct(strptime(paste(data[,1],data[,2]),format="%Y-%m-%d %H:%M:%S",tz='GMT'));

png(filename="plot3.png");

with(data, plot(date_time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"));

with(data, lines(date_time, Sub_metering_1));

with(data, lines(date_time, Sub_metering_2, col="red"));

with(data, lines(date_time, Sub_metering_3, col="blue"));

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1));

dev.off()