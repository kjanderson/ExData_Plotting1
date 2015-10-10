data <- read.csv2('household_power_consumption.txt', na.strings="?")
data.date <- as.Date(data$Date, format="%d/%m/%Y")
data.time <- strptime(as.character(data$Time), format="%H:%M:%S")
data.dt <- paste(data$Date, data$Time)
data.datetime <- strptime(data.dt, format="%d/%m/%Y %H:%M:%S")

idx1 <- data.date >= as.Date("01/02/2007", format="%d/%m/%Y")
idx2 <- data.date <= as.Date("02/02/2007", format="%d/%m/%Y")
idx <- idx1 & idx2

# open graphics device
png(filename = "plot2.png")

par(mfrow = c(1,1))
plot(data.datetime[idx],
     as.numeric(data$Global_active_power[idx])/1000,
     pch='.',
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="n")
lines(data.datetime[idx],
      as.numeric(data$Global_active_power[idx])/1000)

dev.off()

