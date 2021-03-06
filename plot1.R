setwd("c:/Coursera/Exdata-012")
#only read in data of 2/1/2007 and 2/2/2007
f = "data/household_power_consumption.txt"
data <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
head(data)

#Generate plot1.png
png(filename = "plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
hist(data$Global_active_power, col = "red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
