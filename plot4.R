fileDir <- "/Users/AnirudhS/Dropbox/Coursera/Exploratory Data Analysis/Week 1/"
setwd(fileDir)
fileURL <- paste(fileDir,"household_power_consumption.txt", sep = "")
UCIdata <- read.table(fileURL, sep = ";", header = T)

#Subsetting the data between the two dates specified

Sub_UCIData <- UCIdata[UCIdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 3 

#Combining the data and time for the values of the X Axis
X_Axis <- strptime(paste(Sub_UCIData$Date, Sub_UCIData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Converting all the required data to numeric

Sub_UCIData$Sub_metering_1 <- as.numeric(Sub_UCIData$Sub_metering_1)
Sub_UCIData$Sub_metering_2 <- as.numeric(Sub_UCIData$Sub_metering_2)
Sub_UCIData$Sub_metering_3 <- as.numeric(Sub_UCIData$Sub_metering_3)
Sub_UCIData$Voltage <- as.numeric(Sub_UCIData$Voltage)
Sub_UCIData$Global_active_power <- as.numeric(Sub_UCIData$Global_active_power)
Sub_UCIData$Global_reactive_power <- as.numeric(Sub_UCIData$Global_reactive_power)

X_Axis <- strptime(paste(Sub_UCIData$Date, Sub_UCIData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Creating a chart with 2 rows and 2 columns

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(X_Axis,Sub_UCIData$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

plot(X_Axis, Sub_UCIData$Voltage, type = "l", xlab = " ", ylab = "Voltage")

plot(X_Axis, Sub_UCIData$Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering")
lines(X_Axis, Sub_UCIData$Sub_metering_2, type = "l", col = "red")
lines(X_Axis, Sub_UCIData$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "o")

plot(X_Axis, Sub_UCIData$Global_reactive_power, type = "l", xlab = " ", ylab = "Global_reactive_power")

dev.off()
