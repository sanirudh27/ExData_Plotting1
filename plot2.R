fileDir <- "/Users/AnirudhS/Dropbox/Coursera/Exploratory Data Analysis/Week 1/"
setwd(fileDir)
fileURL <- paste(fileDir,"household_power_consumption.txt", sep = "")
UCIdata <- read.table(fileURL, sep = ";", header = T)

#Subsetting the data between the two dates specified

Sub_UCIData <- UCIdata[UCIdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 2

#Step 1 - Finding the day of the week for the date in the column "Date"

#The graph basically is needed in the time format through the days. So combining both the Date & Time

X_Axis <- strptime(paste(Sub_UCIData$Date, Sub_UCIData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Step 2 - Making the Plot

Sub_UCIData$Global_active_power <- as.numeric(Sub_UCIData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(X_Axis , Sub_UCIData$Global_active_power, type='l', xlab="", ylab = "Global Active Power(kilowatt)")
dev.off()
