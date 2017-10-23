raw <- read.table("Downloads/household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))
data <- raw
data$t <- dmy_hms(paste(raw$Date, raw$Time))
data <- data[data$t>as.POSIXct("2007-02-01")&data$t<as.POSIXct("2007-02-03"),]
png(filename="ExData_Plotting1/plot2.png")
Sys.setenv(TZ='UTC')
plot(data$t,data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

