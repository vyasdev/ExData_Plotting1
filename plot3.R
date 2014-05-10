## read Electric power dataset
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

## Select Required Data by dates
selectdate <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Create required plot data vectors
a <- as.numeric(selectdate$Sub_metering_1)
b <- as.numeric(selectdate$Sub_metering_2)
c <- as.numeric(selectdate$Sub_metering_3)
dates <- strptime(paste(selectdate$Date, selectdate$Time), format="%d/%m/%Y %H:%M:%S")

## create a .png file of the plot
png("plot3.png", width = 480, height = 480, units = "px")
plot(dates, a, type="n", xlab="", ylab="Energy sub metering")
points(dates, a, type="l", col="black")
points(dates, b, type="l", col="red")
points(dates, c, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()