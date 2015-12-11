# Create a data directory, download compressed file and unzip 
if(!file.exists("./CS_course_project1")) {dir.create("./CS_course_project1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./CS_course_project1/power_consumption.zip")
unzip(zipfile="./CS_course_project1/power_consumption.zip", exdir="./CS_course_project1")

# Read data and extract subset
dataFile <- "./CS_course_project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", dec=".", na.strings="?")
subData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Prepare data and plot graf4
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- subData$Global_active_power
globalReactivePower <- subData$Global_reactive_power
voltage <- subData$Voltage
subMetering1 <- subData$Sub_metering_1
subMetering2 <- subData$Sub_metering_2
subMetering3 <- subData$Sub_metering_3
png("./CS_course_project1/plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()