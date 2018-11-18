dataPower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dataPower$Date<-as.Date(dataPower$Date,"%d/%m/%Y")
dataSelect<-subset(dataPower,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

datetime<-paste(dataSelect$Date, dataSelect$Time)

dataSelect$DateTime<-as.POSIXct(datetime)

plot(dataSelect$DateTime, dataSelect$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()