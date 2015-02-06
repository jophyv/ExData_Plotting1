# R Script for plot2

#remove(list=ls()) #Clearing the environment

#Read data from the local working directory
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")

feb1<-(power[power$Date == "1/2/2007" ,]) #Extract 1st feb data
feb2<-(power[power$Date == "2/2/2007" ,])#Extract 2nd feb data

#Combine above data sets into one data set
feb1_2<-merge(feb1,feb2,by=intersect (names(feb1),names(feb2)), all=TRUE)

#Plot graph as per the assignment requirements - Convert characted data into "date" format and apply POSIXlt format
with (feb1_2,plot(as.POSIXlt(paste(as.Date(Date,format="%d/%m/%Y"),Time,sep="")),Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png,file="plot2.png")#Copy plot to a PNG file
dev.off() # Close the PNG device