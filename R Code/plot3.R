data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
data$Date<-as.Date(strptime(data$Date,format="%d/%m/%Y"))
data_ref<-data[(data$Date=="2007-02-01")|(data$Date=="2007-02-02"),]

data_ref<-transform(data_ref,Global_active_power=as.numeric(as.character(Global_active_power)))
data_ref<-transform(data_ref,Global_reactive_power=as.numeric(as.character(Global_reactive_power)))
data_ref<-transform(data_ref,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
data_ref<-transform(data_ref,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
data_ref<-transform(data_ref,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
data_ref<-transform(data_ref,Voltage=as.numeric(as.character(Voltage)))

png(filename="./plot3.png", width=480, height=480)
with(data_ref,plot(Sub_metering_1,type="l", xlab="",ylab="Energy sub metering",xaxt="n"))
with(data_ref,points(Sub_metering_2,type="l",col="red"))
with(data_ref,points(Sub_metering_3,type="l",col="blue"))
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()