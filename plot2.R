##Read data and remove all observation but those on 1-st and 2-nd of February 2007/
data<-read.csv("household_power_consumption.txt",sep=";",colClasses = "character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##convert Global active poweer data to numeric for the plot
data$Global_active_power<-as.numeric(data$Global_active_power)

##convert time to time format, remember to use date from the dataset, rather then current date
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d%H:%M:%S")

##plot and export to file
with(data,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()
