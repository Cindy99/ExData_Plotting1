
## This assignment uses data from the UC Irvine Machine Learning Repository. 
## In particular, I am using the "Individual household electric power consumption Data Set" 
## which I have I have downloaded from the course web site.  The data file has been
## unzipped and save to the current working directory.  To save memory resources, I am
## reading in only the rows for Feb 1, 2007 and Feb2, 2007, plus the first row for Feb 3 2007
## from household_power_consumption.txt

## using functions from data.table package
library(data.table)
data<-fread("household_power_consumption.txt",sep=";",skip=66637,nrows=2881)
## use first line for column names
colnames<-fread("household_power_consumption.txt",sep=";",nrows=0)
setnames(data,colnames(colnames))

## adda datetime field
## turn it into a data.frame, add new POSIXlt field combining  Date and Time fields 
data<-data.frame(data)
data$datetime<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

## Plot 4
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfcol = (c(2,2)))
## first plot
plot(data$datetime,data$Global_active_power,xlab="",ylab = "Global Active Power",type="l")
## second plot
with(data,(plot(datetime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")))
with(data,(lines(datetime,Sub_metering_2,type="l",col="red")))
with(data,(lines(datetime,Sub_metering_3,type="l",col="blue")))
legend('topright', names(data[7:9]),lty=1, col=c('black', 'red','blue'), bty='n')
## third plot
with(data,(plot(datetime,Voltage,type="l",col="black")))
## fourth plot
with(data,(plot(datetime,Global_reactive_power,type="l",col="black")))
dev.off()