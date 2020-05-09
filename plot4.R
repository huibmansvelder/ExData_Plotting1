# Exploratory data analysis - Assignment 1
# recreate 4 plots - plot 1
#
# Load packages
library(data.table)
library(dplyr)
library(tidyr)
library(readr)
library(lubridate)

# set single working directory with all relevant files
# setwd("/Users/huib/Documents/Huib/Coursera/DataScience/4-Exploratory Data Analysis/Assignment1")

# Loading file, remove "?" and select required dates
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerfeb12 <- filter(household, household$Date == "1/2/2007" | household$Date == "2/2/2007")
rm(household)

# alter column classes date and time
powerfeb12$Date <- dmy(powerfeb12$Date)
powerfeb12 <- mutate(powerfeb12, ymd_hms(paste(Date, Time)))
names(powerfeb12)<-gsub("ymd_hms\\(paste\\(Date, Time\\)\\)", "datetime", names(powerfeb12))

par(mfcol = c(2,2))
par(mar = c(4,4,1,1))
# plot 1
with(powerfeb12, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# plot 2
x <- c(powerfeb12$datetime, powerfeb12$datetime, powerfeb12$datetime)
Sub_metering_1 <- powerfeb12$Sub_metering_1
Sub_metering_2 <- powerfeb12$Sub_metering_2
Sub_metering_3 <- powerfeb12$Sub_metering_3
y <- c(Sub_metering_1, Sub_metering_2, Sub_metering_3)
g <- gl(3, 2880)
plot(x,y, type = "n", xlab = "", ylab = "Energy sub metering")
points(x[g == 1], y[g == 1], type = 'l')
points(x[g == 2], y[g == 2], type = 'l', col = "red")
points(x[g == 3], y[g == 3], type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = 1, col = c("black", "red", "blue"))

# plot 3
with(powerfeb12, plot(datetime, Voltage, type = "l"))

# plot 4
with(powerfeb12, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, file = "plot4.png")
dev.off()



