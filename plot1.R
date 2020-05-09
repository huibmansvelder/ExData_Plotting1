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
 setwd("/Users/huib/Documents/Huib/Coursera/DataScience/4-Exploratory Data Analysis/Assignment1")

# Loading file, remove "?" and select required dates
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerfeb12 <- filter(household, household$Date == "1/2/2007" | household$Date == "2/2/2007")
rm(household)

# alter column classes date and time
powerfeb12$Date <- dmy(powerfeb12$Date)
powerfeb12$Time <- hms(powerfeb12$Time)

# plot 1 histogram of 'global active power' in kilowatts
hist(powerfeb12$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()



