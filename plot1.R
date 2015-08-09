##Read data and remove all observation but those on 1-st and 2-nd of February 2007/
data<-read.csv("household_power_consumption.txt",sep=";",colClasses = "character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

##convert data to numeric for the histogram
data$Global_active_power<-as.numeric(data$Global_active_power)

## make a histogram and copy it to a file
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",cex.axis=0.5)
dev.copy(png,file="plot1.png")
dev.off()
