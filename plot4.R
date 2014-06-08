require('data.table')

#Read all the data
data <- data.table(read.table('household_power_consumption.txt',na.strings='?',sep=';',header=T))
data[,Date:=as.Date(Date,format='%d/%m/%Y')]

#Get the data for '2007-02-01' and '2007-02-02'
reqdata <- copy(data[Date=='2007-02-01' | Date=='2007-02-02'])
reqdata[,datetime:=as.POSIXct(paste(Date,Time))]

#Plot variation of 4 differenet parameters across datetime to a png file plot4.png
png('plot4.png',height=480,width=480)
par(mfrow=c(2,2))
with(reqdata,{
    plot(datetime,Global_active_power,xlab='',ylab='Global Active Power',type='l')
    plot(datetime,Voltage,xlab='datetime',ylab='Voltage',type='l')
    plot(datetime,Sub_metering_1,xlab='',ylab='Energy sub metering',col='black',type='l')
    points(datetime,Sub_metering_2,col='red',type='l')
    points(datetime,Sub_metering_3,col='blue',type='l')
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.95,bty='n')
    plot(datetime,Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')
})
dev.off()