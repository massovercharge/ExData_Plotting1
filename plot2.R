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
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()


