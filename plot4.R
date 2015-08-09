##Read data and remove all observation but those on 1-st and 2-nd of February 2007/
data<-read.csv("household_power_consumption.txt",sep=";",colClasses = "character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##convert time to time format, remember to use date from the dataset, rather then current date
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d%H:%M:%S")

##converting to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)

##plotting
par(mfcol=c(2,2),cex.lab=0.8, mgp=c(2.5,1,0),cex.axis=0.7)
##global active power plot 
with(data,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
##energy sub metering plot
with(data,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(Time,Sub_metering_2,type="l",col="red"))
with(data,points(Time,Sub_metering_3,type="l",col="blue"))
#adding legend to 2-nd plot
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_1"),cex=0.7,bty="n")
##voltage plot
with(data,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
##reactive power plot
with(data,plot(Time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

#export to file
dev.copy(png,file="plot4.png")
dev.off()