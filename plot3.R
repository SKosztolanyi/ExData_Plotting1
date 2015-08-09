electricity <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings = "?")

days2 <- subset(electricity, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(days2$Date,days2$Time),"%d/%m/%Y %H:%M:%S")
## Previous lines are just how I load the data, create a data.frame and convert the date and time into one variable with specific format

## I now create a plot with 3 different lines and each line has its own color, with default colour leaving black
png("plot3.png", width=480, height=480)
plot(datetime, days2$Sub_metering_1, 
     type="l",
     ylab="Energy Submetering",
     xlab="")
lines(datetime, days2$Sub_metering_2, 
      type="l",
      col="red")
lines(datetime, days2$Sub_metering_3,
      type="l",
      col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"))
dev.off()