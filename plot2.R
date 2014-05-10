##Read Electric Powerset Data
data<-read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
selectdata<-subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

##Start drawing Plot

gap<-as.numeric(selectdata$Global_active_power)
dates<-strptime(paste(selectdata$Date,selectdata$Time), format="%d/%m/%Y %H:%M:%S")

plot(dates, gap, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## create a .png file of the plot

dev.copy(png,file = "plot2.png",width = 480, height = 480, units = "px")
dev.off()