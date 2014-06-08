require('data.table')

#Read all the data
data <- data.table(read.table('household_power_consumption.txt',na.strings='?',sep=';',header=T))
data[,Date:=as.Date(Date,format='%d/%m/%Y')]

#Get the data for '2007-02-01' and '2007-02-02'
reqdata <- copy(data[Date=='2007-02-01' | Date=='2007-02-02'])
reqdata[,datetime:=as.POSIXct(paste(Date,Time))]

#Plot the datetime vs Energy sub metering for 3 types of submeters to a png file plot3.png
png('plot3.png',height=480,width=480)
plot(reqdata$datetime,reqdata$Sub_metering_1,xlab='',ylab='Energy sub metering',col='black',type='l')
points(reqdata$datetime,reqdata$Sub_metering_2,col='red',type='l')
points(reqdata$datetime,reqdata$Sub_metering_3,col='blue',type='l')
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()