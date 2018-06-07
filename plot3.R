data_file <- "./data/household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
new_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(new_data$Global_active_power)
sub_metering1 <- as.numeric(new_data$Sub_metering_1)
sub_metering2 <- as.numeric(new_data$Sub_metering_2)
sub_metering3 <- as.numeric(new_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()