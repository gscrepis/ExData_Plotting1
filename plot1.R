# Create a data directory, download compressed file and unzip 
if(!file.exists("./CS_course_project1")) {dir.create("./CS_course_project1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./CS_course_project1/power_consumption.zip")
unzip(zipfile="./CS_course_project1/power_consumption.zip", exdir="./CS_course_project1")

# Read data and extract subset
dataFile <- "./CS_course_project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", dec=".", na.strings="?")
subData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Plot graf1
globalActivePower <- subData$Global_active_power
png("./CS_course_project1/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()