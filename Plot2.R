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
## Create Plot 2
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
