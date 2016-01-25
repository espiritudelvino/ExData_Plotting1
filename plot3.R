data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
twoDays <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

png("plot3.png", width=480, height=480)

fullDate <- strptime(paste(twoDays$Date, twoDays$Time), "%d/%m/%Y %H:%M:%S") 
plot(fullDate, as.numeric(twoDays$Sub_metering_1), type = "l", col = "black", xlab=" ", ylab="Energy sub metering")
lines(fullDate, as.numeric(twoDays$Sub_metering_2), type = "l", col = "red")
lines(fullDate, as.numeric(twoDays$Sub_metering_3), type = "l", col = "blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1)

dev.off()