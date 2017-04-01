# Get file, unzip and import data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
unlink(temp)

# Subset data as described in assignment
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Write plot to PNG graphics device
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
