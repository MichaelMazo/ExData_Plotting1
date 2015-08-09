##Read data and remove all observation but those on 1-st and 2-nd of February 2007/
data<-read.csv("household_power_consumption.txt",sep=";",colClasses = "character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##convert time to time format, remember to use date from the dataset, rather then current date
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d%H:%M:%S")

##convert sub metering 1,2, and 3 to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

##plotting
with(data,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(Time,Sub_metering_2,type="l",col="red"))
with(data,points(Time,Sub_metering_3,type="l",col="blue"))

#adding legend
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_1"))

##export to file
dev.copy(png,file="plot3.png")
dev.off()