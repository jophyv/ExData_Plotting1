# R Script for plot3

#remove(list=ls()) #Clearing the environment

#Read data from the local working directory
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

feb1<-(power[power$Date == "1/2/2007" ,]) #Extract 1st feb data
feb2<-(power[power$Date == "2/2/2007" ,])#Extract 2nd feb data

#Combine above data sets into one data set
feb1_2<-merge(feb1,feb2,by=intersect (names(feb1),names(feb2)), all=TRUE)

#Set Margins
#par(mar=c(1,4,1,1.75))
par(mar=c(2,4,2,1))

#Plot graph without any data points
plot(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")

#Add legends to the plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.75)

#Add lines to the plot fora each of the measurement
lines(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_1,type="l")
lines(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_2,col="red",type="l")
lines(as.POSIXlt(paste(as.Date(feb1_2$Date,format="%d/%m/%Y"),feb1_2$Time,sep="")),feb1_2$Sub_metering_3,col="blue",type="l")

dev.copy(png,file="plot3.png",width=560,height=480) #Copy plot to a PNG file.
dev.off() # Close the PNG device