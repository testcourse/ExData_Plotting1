
library(sqldf);

data <- read.csv.sql("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE,sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"');

data[,1] <- as.Date(data[,1],"%d/%m/%Y");

date_time <- as.POSIXct(strptime(paste(data[,1],data[,2]),format="%Y-%m-%d %H:%M:%S",tz='GMT'));

plot(date_time,data[,7], type='l',xlab="", ylab="Global Active Power(killowatts)", col="black");

lines(date_time,as.numeric(data[,8]), type='l', col='red');

lines(date_time,as.numeric(data[,9]), type='l', col='blue');

legend("topright", pch=1, seg.len=4,col = c("black","red","blue"),lty=1,legend=c("sub_metering_1","sub_metering_2","sub_metering_3"));

dev.copy(png,"plot3.png", width=480, height=480);

dev.off();
