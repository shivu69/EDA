setwd("~/ExData_Plotting1")
householdFile <- ".EDA/data/household_power_consumption.txt"
##
if (!file.exists(householdFile)) {
  download.file(downloadURL, downloadFile, method = "curl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}
##
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##
## Generating Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
