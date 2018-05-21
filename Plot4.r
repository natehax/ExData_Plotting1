#This script is intended to solve the Electric Power Consumption Dataset
library(dplyr)
library(readr)
library(utf8)
library(lubridate)

setwd("C:/Users/nathanielc/Documents")

#Clean the Data
power <- read_csv2("household_power_consumption.txt",col_names=TRUE)
power <- filter(power,Date=="1/2/2007"|Date=="2/2/2007")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$DateTime <- parse_date_time(paste(power$Date,power$Time),"dmY HMS")
power$Weekday <- as.factor(weekdays(power$DateTime))

#Plot 4--Multiple Charts
png(filename="Plot4.png")
par(mfrow=c(2,2))
#TopLeft
plot(x=power$DateTime,y=power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")
#TopRight
plot(x=power$DateTime,y=power$Voltage/1000,xlab="datetime",ylab="Voltage",type="l")
#BottomLeft
plot(x=power$DateTime,y=power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(x=power$DateTime,y=power$Sub_metering_2,col="red",type="l")
lines(x=power$DateTime,y=power$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")
#BottomRight
plot(x=power$DateTime,y=power$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()