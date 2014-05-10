##Read Electric Powerset Data
data<-read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE)
selectdata<-subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

##Start drawing Histogram
plotdata<-as.numeric(selectdata$Global_active_power)
hist(plotdata,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency")

## create a .png file of the histogram

dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")
dev.off()
