setwd("c:/Coursera/Exdata-012")
## Read in full data
dataFull <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE,na.strings="?",check.names=F,stringsAsFactors=F)
dataFull$Date <- as.Date(dataFull$Date, format = "%d/%m/%Y")

## Subsetting data
data <- subset(dataFull,subset = (Date >= "2007-2-1" & Date <= "2007-2-2"))
head(data)

rm(dataFull)

## Add a Datetime field to frame
data$Datetime <- as.POSIXct(paste(as.Date(data$Date, format="%Y-%m-%d"), data$Time))


## Generate plot3
png(filename = "plot3.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
with(data, {
  plot(Sub_metering_1 ~ Datetime, type ="l",ylab="Global Active Power (kilowatts)",xlab="")
  lines(Sub_metering_2 ~ Datetime, type ="l",col = "Red",ylab="",xlab="")
  lines(Sub_metering_3 ~ Datetime, type ="l",col = "Blue",ylab="",xlab="")
})
legend("topright",col = c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
