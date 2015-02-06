# R Script for plot1


remove(list=ls()) #Clearing the environment

#Read data from the text file
power<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?")


feb1<-(power[power$Date == "1/2/2007" ,]) #Extract 1st feb data
feb2<-(power[power$Date == "2/2/2007" ,])#Extract 2nd feb data

#Combine above data sets into one data set
feb1_2<-merge(feb1,feb2,by=intersect (names(feb1),names(feb2)), all=TRUE)

#Plot Histogram as per the assignment requirements
hist(feb1_2$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

dev.copy(png,file="plot1.png")#Copy plot to a PNG file
dev.off() # Close the PNG device