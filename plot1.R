require('data.table')

#Read all the data
data <- data.table(read.table('household_power_consumption.txt',na.strings='?',sep=';',header=T))
data[,Date:=as.Date(Date,format='%d/%m/%Y')]

#Get the data for '2007-02-01' and '2007-02-02'
reqdata <- copy(data[Date=='2007-02-01' | Date=='2007-02-02'])
reqdata[,datetime:=as.POSIXct(paste(Date,Time))]

#Plot the Global_active_power vs its Frequency to a png file plot1.png
png('plot1.png',height=480,width=480)
hist(reqdata$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()