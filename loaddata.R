loadfile <- function() {
  powerCons <- read.csv2("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                         stringsAsFactors=F)
  powerData <- subset(powerCons, Date=="1/2/2007" | Date=="2/2/2007")
  #powerData$Date <- as.Date(powerData$Date, "%d/%m/Y")
  rm(powerCons)
  
  ## Converting dates
  datetime <- paste(as.Date(powerData$Date, "%d/%m/%Y"), powerData$Time)
  powerData$Datetime <- as.POSIXct(datetime)
  
  return (powerData)
}