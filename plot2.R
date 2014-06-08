require('data.table')

#Read all the data
data <- data.table(read.table('household_power_consumption.txt',na.strings='?',sep=';',header=T))
data[,Date:=as.Date(Date,format='%d/%m/%Y')]

#Get the data for '2007-02-01' and '2007-02-02'
reqdata <- copy(data[Date=='2007-02-01' | Date=='2007-02-02'])
reqdata[,datetime:=as.POSIXct(paste(Date,Time))]

#Plot the datetime vs its Global_active_power to a png file plot2.png
png('plot2.png',height=480,width=480)
plot(reqdata$datetime,reqdata$Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type='l')
dev.off()