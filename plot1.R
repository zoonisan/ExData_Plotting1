##  Create a histogram for Global Active Power and save it to plot1.png file
## 
# read only data from the dates 2007-02-01 and 2007-02-02
dd <- read.table("household_power_consumption.txt", skip=grep("31/1/2007;23:59:00", 
                    readLines("household_power_consumption.txt")),nrows=2880,sep=';')
colnames(dd) <- c("Date","Time","Global_active_power","Global_reactive_power", 
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# convert date time format
dd[["Time"]] <- strptime(paste(dd[["Date"]], dd[["Time"]]), format="%d/%m/%Y %H:%M:%S" )
dd[["Date"]] <- as.Date(dd[["Date"]], format="%d/%m/%Y")

## generate a histogram and save it to plot1.png file
library(datasets)
hist(dd$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png")
dev.off()  