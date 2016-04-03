fileDir <- "/Users/AnirudhS/Dropbox/Coursera/Exploratory Data Analysis/Week 1/"
setwd(fileDir)
fileURL <- paste(fileDir,"household_power_consumption.txt", sep = "")
UCIdata <- read.table(fileURL, sep = ";", header = T)

#Subsetting the data between the two dates specified

Sub_UCIData <- UCIdata[UCIdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 1 Code = Global Active Power

Sub_UCIData$Global_active_power <- as.numeric(Sub_UCIData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Sub_UCIData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()

