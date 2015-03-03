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


## Generate plot2
png(filename = "plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
plot(data$Global_active_power ~ data$Datetime,type="l", ylab="Global Active Power (kilowatts)",xlab="")
#dev.copy(png,file="plot2.png")
dev.off()
