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

#Plot all graphs on a canvas to see what it looks like
par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power (kilowatts)")

plot(data$DateTime, data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"))

plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

#Send the same plot to a file with the required dimensions
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power (kilowatts)")

plot(data$DateTime, data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"))

plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()