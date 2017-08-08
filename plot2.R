
powerCons <- read.csv2("household_power_consumption.txt", sep = ";", header = TRUE, 
                       dec = ".", stringsAsFactors = FALSE)
powerData <- subset(powerCons, Date=="1/2/2007" | Date=="2/2/2007")
#powerData$Date <- as.Date(powerData$Date, "%d/%m/Y")
rm(powerCons)

## Converting dates
datetime <- paste(as.Date(powerData$Date, "%d/%m/%Y"), powerData$Time)
powerData$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(powerData$Global_active_power)

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)

plot(globalActivePower~powerData$Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

dev.off()

