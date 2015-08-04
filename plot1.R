file = 'household_power_consumption.txt'
#File is to big read the whole thing every time so lets get header information and then the info
#from the dates requested
tmp <- read.table(file,sep=';',nrows=1,stringsAsFactors = FALSE)
start = 66637
end = 69517
epow <- read.table(file,sep=';',na.strings =  '?',header=FALSE,skip=start,nrows = end-start)
colnames(epow) <- unlist(tmp)
datetime <- strptime(paste(epow$Date,epow$Time),"%d/%m/%Y %T")
png(file='plot1.png')
hist(epow$Global_active_power,col='red',
     xlab = 'Global Active Power [kW]', main = 'UCI Indvidual Electrical Power Dataset\nFeb 1-2 2007')
dev.off()
