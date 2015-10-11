## generate multiple plots in one page and save it to plot4.png file
library(datasets)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
#
plot(dd$Time, dd$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(dd$Time, dd$Global_active_power)
#
plot(dd$Time, dd$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(dd$Time, dd$Voltage)
#
plot(dd$Time, dd$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dd$Time, dd$Sub_metering_1, col="black")
lines(dd$Time, dd$Sub_metering_2, col="red")
lines(dd$Time, dd$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), lwd=c(2.5,2.5, 2.5), cex=0.75, bty="n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
plot(dd$Time, dd$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(dd$Time, dd$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off() 