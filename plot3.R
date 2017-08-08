
source("loaddata.R")
powerData <- loadfile()

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)

with(powerData, {
       plot(Sub_metering_1~Datetime, type="l",
                       ylab="Energy sub metering", xlab="")
       lines(Sub_metering_2~Datetime,col='Red')
       lines(Sub_metering_3~Datetime,col='Blue')
   })

legend("topright", col = c("black", "red", "blue"), lwd = 1, lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()

