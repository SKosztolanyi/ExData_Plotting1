# Here is how I loaded the data and prepared it for plotting
# At first, I read the document and named the dataframe "electricity"
electricity <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings = "?")
# the items are separated by ";" and na.strings in this document are written as "?"
# I have now large dataframe with 2 075 259 rows and 9 variables, that is why I want to subset only the 2 days I will be using: 
days2 <- subset(electricity, Date == "1/2/2007" | Date == "2/2/2007")

# Then I need to merge and convert the Time and Date variable so I can work with them in plots
# First I merge them into one variable using function paste, I call the variable "datetime":

datetime <- strptime(paste(days2$Date,days2$Time),"%d/%m/%Y %H:%M:%S")

# I then give other format to the datetime variable with function strptime and I give it the correct format

# Now I have all the variables ready for plotting

## I wanted to add column "datetime" into dataframe "days2" but I couldn't find a way of doing it correctly without datetime losing formatting
## that is why I leave it as it is and use it as a separate vector when plotting

