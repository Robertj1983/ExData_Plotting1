#Clear all variables
rm(list = ls())

#Set the working directory
setwd("D:/Users/Robert/Desktop/Coursera/Data Science Specialisation/Exploratory Data Analysis/Project1/src/ExData_Plotting1")

#Read in all the data, keep the Date and Times as strings for custom conversion later
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#Create a column for the DateTime
data$DateTime <- strptime(paste(data$Date, data$Time, ' '), format = "%d/%m/%Y %H:%M:%S")

#Convert the date column to an actual Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset on the dates 2007-02-01 and 2007-02-02
data <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

#Plot line graph to see what it looks like
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Send the same plot to a file with the required dimensions
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()