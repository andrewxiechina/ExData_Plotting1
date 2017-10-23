data <- read.table("Downloads/household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))
library(lubridate)
data$Date <- dmy(data$Date)
data <- data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]
png(filename="ExData_Plotting1/plot1.png")
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red"
  )
dev.off()
