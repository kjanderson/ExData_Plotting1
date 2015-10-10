data <- read.csv2('household_power_consumption.txt', na.strings="?")
data.date <- as.Date(data$Date, format="%d/%m/%Y")
data.time <- strptime(as.character(data$Time), format="%H:%M:%S")
data.dt <- paste(data$Date, data$Time)
data.datetime <- strptime(data.dt, format="%d/%m/%Y %H:%M:%S")

idx1 <- data.date >= as.Date("01/02/2007", format="%d/%m/%Y")
idx2 <- data.date <= as.Date("02/02/2007", format="%d/%m/%Y")
idx <- idx1 & idx2

# open the graphics device
png(filename = "plot3.png")

par(mfrow = c(1,1))
plot(data.datetime[idx],
     data$Sub_metering_1[idx],
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(data.datetime[idx], data$Sub_metering_1[idx], col="black")
lines(data.datetime[idx], data$Sub_metering_2[idx], col="red")
lines(data.datetime[idx], data$Sub_metering_3[idx], col="blue")
legend(x="topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       bg="white")

dev.off()

