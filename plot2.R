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
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(subdata$Time, subdata$Global_active_power, type = "n", xlab = "", 
     ylab = "Global Active Power (kilowats)")
lines(subdata$Time, subdata$Global_active_power)
dev.off()
