
library(sqldf);

data <- read.csv.sql("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE,sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"');

data[,1] <- as.Date(data[,1],"%d/%m/%Y");

date_time <- as.POSIXct(strptime(paste(data[,1],data[,2]),format="%Y-%m-%d %H:%M:%S",tz='GMT'));

par(mfrow=c(2,2))

plot(date_time,data[,3], type='l', xlab="", ylab="Global Active Power");

plot(date_time,data[,5], type='l', xlab="datetime", ylab="Voltage");



with(data,plot(date_time,data[,7], type='n',xlab="", ylab="Global Active Power(killowatts)"));

with(data,lines(date_time,data[,7],type='l'));

with(data,lines(date_time,as.numeric(data[,8]), col='red'));

with(data,lines(date_time,as.numeric(data[,9]), col='blue'));

legend("topright", cex = .7,bty='n', xjust=1, col = c("black","red","blue"),lty=c(1,1,1),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"));



plot(date_time,data[,4], type='l', xlab="datetime", ylab="Global_reactive_power");

dev.copy(png,"plot4.png", width=480, height=480);

dev.off();