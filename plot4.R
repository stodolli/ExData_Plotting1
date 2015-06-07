## Reading the data
rawdata <- read.table("../household_power_consumption.txt", header = TRUE, 
                      na.strings = "?", sep=";", 
                      colClasses = c("character", "character", "numeric", 
                                     "numeric", "numeric", "numeric", "numeric", 
                                     "numeric", "numeric"))
#  Convert Date and Time variables to Date/Time classes
rawdata$Time <- strptime(paste(rawdata$Date, rawdata$Time), 
                         format = "%d/%m/%Y %H:%M:%S")
rawdata$Date <- as.Date(rawdata$Time)
#  Subset just the required 2 days in February
subdata <- rawdata[rawdata$Date >= as.Date("2007-02-01") & 
                       rawdata$Date <= as.Date("2007-02-02"),]

## Making plots
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))
plot(subdata$Time, subdata$Global_active_power, type = "n", xlab = "", 
     ylab = "Global Active Power")
lines(subdata$Time, subdata$Global_active_power)
plot(subdata$Time, subdata$Voltage, type = "n", xlab = "datetime", 
     ylab = "Voltage")
lines(subdata$Time, subdata$Voltage)
plot(subdata$Time, subdata$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(subdata$Time, subdata$Sub_metering_1, col = "black")
lines(subdata$Time, subdata$Sub_metering_2, col = "red")
lines(subdata$Time, subdata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "blue", "red"), bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subdata$Time, subdata$Global_reactive_power, type = "n", xlab = "datetime", 
     ylab = "Global reactive power")
lines(subdata$Time, subdata$Global_reactive_power)
dev.off()
