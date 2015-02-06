# R Script for plot4

#remove(list=ls()) #Clearing the environment

#Read data from the local working directory
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

feb1<-(power[power$Date == "1/2/2007" ,]) #Extract 1st feb data
feb2<-(power[power$Date == "2/2/2007" ,])#Extract 2nd feb data

#Combine above data sets into one data set
feb1_2<-merge(feb1,feb2,by=intersect (names(feb1),names(feb2)), all=TRUE)

par(mfcol=c(2,2))
par(mar=c(4,4,2,2))

#Plot Graph 1
with (feb1_2,plot(as.POSIXlt(paste(as.Date(Date,format="%d/%m/%Y"),Time,sep="")),Global_active_power,type="l",xlab="", ylab="Global Active Power"))

#Plot graph 2
plot(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")

#Add legends to the plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.5)

#Add lines to the plot fora each of the measurement
lines(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_1,type="l")
lines(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_2,col="red",type="l")
lines(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_3,col="blue",type="l")

#Plot Graph3
with (feb1_2,plot(as.POSIXlt(paste(as.Date(Date,format="%d/%m/%Y"),Time,sep="")),Voltage, type="l",xlab="datetime", ylab="Voltage"))

#Plot Graph4
with (feb1_2,plot(as.POSIXlt(paste(as.Date(Date,format="%d/%m/%Y"),Time,sep="")),Global_reactive_power, type="l",xlab="datetime"))

dev.copy(png,file="plot4.png",width=540,height=480) #Copy plot to a PNG file
dev.off() # Close the PNG device