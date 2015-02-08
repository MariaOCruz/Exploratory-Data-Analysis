
# Setting the working directory to a temporary directory
setwd(Sys.getenv("TEMP"))
# Downloading and unzipping file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- ".\\project1data.zip"
download.file(url,destfile)
unzip(destfile)
# Reading file and changing variable formats
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
# Selecting date range
dataSub <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
# Creating PNG histogram
png("plot1.png", width = 480, height = 480)
hist(dataSub$Global_active_power, col = 2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
