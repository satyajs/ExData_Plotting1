
powerCons <- read.csv2("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerData <- subset(powerCons, Date=="1/2/2007" | Date=="2/2/2007")
#powerData$Date <- as.Date(powerData$Date, "%d/%m/Y")
rm(powerCons)

## Converting dates
datetime <- paste(as.Date(powerData$Date, "%d/%m/%Y"), powerData$Time)
powerData$Datetime <- as.POSIXct(datetime)

#submetering1 <- as.numeric(powerData$Sub_metering_1)
#submetering2 <- as.numeric(powerData$Sub_metering_2)
#submetering3 <- as.numeric(powerData$Sub_metering_3)

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
