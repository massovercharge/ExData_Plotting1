# Get file, unzip and import data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep = ";", na.strings = "?")
unlink(temp)

# Subset data as described in assignment
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Combine Date and Time to make DateTime variable
data <- cbind("DateTime" = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), data)

# Write plot to PNG graphics device
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfcol=c(2,2))

# top left
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# bottom left
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n", col=c("black", "red", "blue"), cex = 0.9)

# top right
plot(x = data$DateTime, y = data$Voltage, type="l", xlab="DateTime", ylab="Voltage")

# bottom right
plot(x = data$DateTime, y = data$Global_reactive_power, type="l", xlab="DateTime", ylab="Global_reactive_power")

dev.off()
