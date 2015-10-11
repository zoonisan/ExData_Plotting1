##  Create a multi linechart for energy sub metering and save it to plot3.png file
## 
# read only data from the dates 2007-02-01 and 2007-02-02
dd <- read.table("household_power_consumption.txt", skip=grep("31/1/2007;23:59:00", 
                    readLines("household_power_consumption.txt")),nrows=2880,sep=';')
colnames(dd) <- c("Date","Time","Global_active_power","Global_reactive_power", 
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# convert date time format
dd[["Time"]] <- strptime(paste(dd[["Date"]], dd[["Time"]]), format="%d/%m/%Y %H:%M:%S" )
dd[["Date"]] <- as.Date(dd[["Date"]], format="%d/%m/%Y")

## generate a multi linechart and save it to plot3.png file
library(datasets)
plot(dd$Time, dd$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dd$Time, dd$Sub_metering_1, col="black")
lines(dd$Time, dd$Sub_metering_2, col="red")
lines(dd$Time, dd$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), lwd=c(2.5,2.5, 2.5), cex=0.75, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off() 