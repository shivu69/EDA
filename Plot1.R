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
## Generating Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
