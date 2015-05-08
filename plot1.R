# Reading and parsing dates
myData <- read.csv2("household_power_consumption.txt", header= TRUE, col.names = c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3"), na.strings="?", dec=".")
myData$datetime <- paste(myData$date, myData$time,sep = " ")
myData$datetime <- strptime(myData$datetime,"%d/%m/%Y %H:%M:%S")

# Subsetting
myData <- myData[myData$datetime>=as.POSIXlt("2007-02-01") & myData$datetime < as.POSIXlt("2007-02-03"),]

# Plotting
# Plot 1
png(filename="plot1.png", width=480, height=480)
hist(myData$global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()