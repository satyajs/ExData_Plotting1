
source("loaddata.R")
powerData <- loadfile()

globalActivePower <- as.numeric(powerData$Global_active_power)

hist(globalActivePower, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

