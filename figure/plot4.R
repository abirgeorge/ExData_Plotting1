data_file <- "./data/household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
new_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


date_time <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(new_data$Global_active_power)
globalReactivePower <- as.numeric(new_data$Global_reactive_power)
voltage <- as.numeric(new_data$Voltage)
sub_metering1 <- as.numeric(new_data$Sub_metering_1)
sub_metering2 <- as.numeric(new_data$Sub_metering_2)
sub_metering3 <- as.numeric(new_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_time, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()