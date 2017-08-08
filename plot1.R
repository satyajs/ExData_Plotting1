
powerCons <- read.csv2("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      stringsAsFactors=F)
powerData <- subset(powerCons, Date=="1/2/2007" | Date=="2/2/2007")
#powerData$Date <- as.Date(powerData$Date, "%d/%m/Y")
rm(powerCons)

## Converting dates
datetime <- paste(as.Date(powerData$Date, "%d/%m/%Y"), powerData$Time)
powerData$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(powerData$Global_active_power)

hist(globalActivePower, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

