
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

## Plot 2
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(data$datetime,data$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",type="l")
dev.off()
