
source("loaddata.R")
powerData <- loadfile() 

# Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)

globalActivePower <- as.numeric(powerData$Global_active_power)
voltage <- as.numeric(powerData$Voltage)
globalReactivePower <- as.numeric(powerData$Global_reactive_power)

par(mfrow=c(2,2))

plot(globalActivePower ~ powerData$Datetime, 
                type="l", ylab="Global Active Power", xlab="")
plot(voltage ~ powerData$Datetime, type ="l", ylab ="votlage", xlab = "datetime")

with(powerData, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col = c("black", "red", "blue"), lwd = 1, lty=1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

plot(globalReactivePower ~ powerData$Datetime, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()

