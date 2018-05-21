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

#Plot 2--Line chart; Global Active Power by Time (weekday)
png(filename="Plot2.png")
plot(x=power$DateTime,y=power$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")
dev.off()