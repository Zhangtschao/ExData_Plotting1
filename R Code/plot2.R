data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
data$Date<-as.Date(strptime(data$Date,format="%d/%m/%Y"))
data_ref<-data[(data$Date=="2007-02-01")|(data$Date=="2007-02-02"),]

data_ref<-transform(data_ref,Global_active_power=as.numeric(as.character(Global_active_power)))
data_ref<-transform(data_ref,Global_reactive_power=as.numeric(as.character(Global_reactive_power)))
data_ref<-transform(data_ref,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
data_ref<-transform(data_ref,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
data_ref<-transform(data_ref,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
data_ref<-transform(data_ref,Voltage=as.numeric(as.character(Voltage)))

png(filename="./plot2.png",width=480,height=480)
plot(data_ref$Global_active_power,xaxt="n",type="l",xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()

