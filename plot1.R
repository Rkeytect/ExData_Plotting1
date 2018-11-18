dataPower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dataPower$Date<-as.Date(dataPower$Date,"%d/%m/%Y")
dataPower$Time<-strptime(dataPower$Time,"%H:%M:%S")

dataSelect<-subset(dataPower,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"),Global_active_power)
hist(dataSelect[,1],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()