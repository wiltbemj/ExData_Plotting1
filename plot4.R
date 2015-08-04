file = 'household_power_consumption.txt'
#File is to big read the whole thing every time so lets get header information and then the info
#from the dates requested
tmp <- read.table(file,sep=';',nrows=1,stringsAsFactors = FALSE)
start = 66637
end = 69517
epow <- read.table(file,sep=';',na.strings =  '?',header=FALSE,skip=start,nrows = end-start)
colnames(epow) <- unlist(tmp)
datetime <- strptime(paste(epow$Date,epow$Time),"%d/%m/%Y %T")
png(file='plot4.png')
par(mfcol=c(2,2),oma=c(0,0,2,0))
plot(datetime,epow$Global_active_power,type='l',
     ylab = 'Global Active Power [kW]', xlab = 'Date Time')
plot(datetime,epow$Sub_metering_1,type='l',
     ylab = 'Energy Submetering [kW]', xlab = 'Date Time')
lines(datetime,epow$Sub_metering_2,type='l',col='red')
lines(datetime,epow$Sub_metering_3,type='l',col='blue')
legend('topright',colnames(epow[7:9]),col=c('black','red','blue'),lwd=1)
plot(datetime,epow$Voltage,type='l',
     ylab = 'Voltage [V]', xlab = 'Date Time')
plot(datetime,epow$Global_reactive_power,type='l',
     ylab = 'Global Reactive Power [kW]', xlab = 'Date Time')
mtext('UCI Indvidual Electrical Power Dataset - Feb 1-2 2007',outer=TRUE,cex=1.5)
dev.off()
