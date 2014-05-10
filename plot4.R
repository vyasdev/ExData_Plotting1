## read Electric power dataset
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

## Select Required Data by dates
selectdate <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Create required plot data vectors
gap<-as.numeric(selectdata$Global_active_power)
dates<-strptime(paste(selectdata$Date,selectdata$Time), format="%d/%m/%Y %H:%M:%S")
voltage<-as.numeric(selectdata$Voltage)
a <- as.numeric(selectdate$Sub_metering_1)
b <- as.numeric(selectdate$Sub_metering_2)
c <- as.numeric(selectdate$Sub_metering_3)
reactivepower<-as.numeric(selectdata$Global_reactive_power)

##Creating Plot
png('plot4.png', 480, 480)
par(mfrow = c(2, 2))
with(selectdata,{
  ## Line plot 1
  plot(dates, gap, type = 'l', xlab = '', ylab = "Global Active Power")
  
  ## Line plot 2
  plot(dates, voltage, type = 'l',xlab="datetime",ylab="Voltage")
  
  ## Line plot 3
  plot(dates, a, type="n", xlab="", ylab="Energy sub metering")
  points(dates, a, type="l", col="black")
  points(dates, b, type="l", col="red")
  points(dates, c, type="l", col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Line plot 4
  plot(dates, reactivepower, type = 'l',xlab="datetime",ylab="Global_reactive_power")
})

dev.off()
  
