dataPower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dataPower$Date<-as.Date(dataPower$Date,"%d/%m/%Y")
dataSelect<-subset(dataPower,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

datetime<-paste(dataSelect$Date, dataSelect$Time)

dataSelect$DateTime<-as.POSIXct(datetime)

par(mfcol=c(2,2))
par(mar=c(4,4,2,1))
par(oma=c(0,0,2,0))

plot(dataSelect$DateTime, dataSelect$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(dataSelect$DateTime, dataSelect$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(dataSelect$DateTime,dataSelect$Sub_metering_2,col="red")
lines(dataSelect$DateTime,dataSelect$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.5)

plot(dataSelect$DateTime, dataSelect$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

plot(dataSelect$DateTime, dataSelect$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()