raw <- read.table("Downloads/household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))
data <- raw
data$t <- dmy_hms(paste(raw$Date, raw$Time))
data <- data[data$t>as.POSIXct("2007-02-01")&data$t<as.POSIXct("2007-02-03"),]
png(filename="ExData_Plotting1/plot3.png")
plot(data$t,data$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
lines(data$t,data$Sub_metering_2, type = "l", col="red")
lines(data$t,data$Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()

