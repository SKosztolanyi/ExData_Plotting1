electricity <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings = "?")

days2 <- subset(electricity, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(days2$Date,days2$Time),"%d/%m/%Y %H:%M:%S")
## Previous lines are just how I load the data, create a data.frame and convert the date and time into one variable with specific format

## here I use mfcol command to put 4 different plots into one png file
png("plot4.png", 
    width = 480, height = 480)
par(mfcol=c(2,2))
plot(datetime, days2$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
plot(datetime, days2$Sub_metering_1, type="l",ylab="Energy Submetering", xlab="")
      lines(datetime, days2$Sub_metering_2, type="l",col="red")
      lines(datetime, days2$Sub_metering_3,type="l",col="blue") 
            col=c("black", "red", "blue")
            xlim=c(min.width,max.width), ylim=c(min.length,max.length))
## I had problems with this graph - I couldn't make it small and fit and have legend at top right corner at the same time
## That is why I leave this second plot without legend
plot(datetime, days2$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, days2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()