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

#Plot 1--Grouped Data
png(filename="Plot1.png")
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()