electricity <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings = "?")
 
days2 <- subset(electricity, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(days2$Date,days2$Time),"%d/%m/%Y %H:%M:%S")
## Previous lines are just how I load the data, create a data.frame and convert the date and time into one variable with specific format

## This creates simple histogram with chosen parameters
png("plot1.png", 
      width = 480, height = 480)
hist(days2$Global_active_power, 
      col = "red", 
      main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)",
      breaks = 12, ylim = c(0, 1200))
dev.off()