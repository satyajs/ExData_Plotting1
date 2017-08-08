
source("loaddata.R")
powerData <- loadfile()

globalActivePower <- as.numeric(powerData$Global_active_power)

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)

plot(globalActivePower~powerData$Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")

dev.off()

