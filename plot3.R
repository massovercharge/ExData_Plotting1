temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep = ";", na.strings = "?")
unlink(temp)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data <- cbind("DateTime" = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), data)


png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()


