dataPower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dataPower$Date<-as.Date(dataPower$Date,"%d/%m/%Y")
dataSelect<-subset(dataPower,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

datetime<-paste(dataSelect$Date, dataSelect$Time)

dataSelect$DateTime<-as.POSIXct(datetime)

plot(dataSelect$DateTime, dataSelect$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(dataSelect$DateTime,dataSelect$Sub_metering_2,col="red")
lines(dataSelect$DateTime,dataSelect$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.5)
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()