if(!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata-data-household_power_consumption.zip")
        unzip("exdata-data-household_power_consumption.zip")
}
colcl <- c("character", "character", rep("numeric", 7))
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colcl, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))
data$Date <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
png("plot2.png")
par(mar = c(2, 4, 2, 2))
plot(data$Time, data[,3], type ="l", ylab = "Global Active Power (kilowatts)")
dev.off()