# Reading and parsing dates
myData <- read.csv2("household_power_consumption.txt", header= TRUE, col.names = c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3"), na.strings="?", dec=".")
myData$datetime <- paste(myData$date, myData$time,sep = " ")
myData$datetime <- strptime(myData$datetime,"%d/%m/%Y %H:%M:%S")

# Subsetting
myData <- myData[myData$datetime>=as.POSIXlt("2007-02-01") & myData$datetime < as.POSIXlt("2007-02-03"),]

# Plotting
# Plot 3
png(filename="plot3.png", width=480, height=480)
plot(myData$datetime,myData$sub_metering_1,type = "l",xlab="",ylab="Energy sub metering", col="black")
lines(myData$datetime,myData$sub_metering_2,type = "l",xlab="",ylab="Energy sub metering", col="red")
lines(myData$datetime,myData$sub_metering_3,type = "l",xlab="",ylab="Energy sub metering", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black',"red","blue"), lwd=1)
dev.off()
