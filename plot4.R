raw <- read.table("Downloads/household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))
data <- raw
data$t <- dmy_hms(paste(raw$Date, raw$Time))
data <- data[data$t>as.POSIXct("2007-02-01")&data$t<as.POSIXct("2007-02-03"),]

png(filename="ExData_Plotting1/plot4.png")
par(mfrow = c(2, 2))
plot(data$t,data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data$t,data$Voltage, type = "l", xlab="datatime", ylab="Voltage")

plot(data$t,data$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
lines(data$t,data$Sub_metering_2, type = "l", col="red")
lines(data$t,data$Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)

plot(data$t,data$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
