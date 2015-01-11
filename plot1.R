# set working directory
setwd("/Users/theochristian/Dropbox/Coursera/exploratory_data_analysis/Assignment1/ExData_Plotting1")

# load req libraries
library(data.table)
library(lubridate)

# read in data for period 1/2/2007 - 2/2/2007 from source text file
variableClass <- c(rep('character',2),rep('numeric',7))
power.consumption <- read.table('household_power_consumption.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variableClass)
power.consumption <- power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]

# clean data
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]

# write cleaned data to file new_power_consumption.txt
write.table(power.consumption,file='new_power_consumption.txt',sep=';',row.names=FALSE)
dir.create('plot 1')

# create histogram
png(filename='plot 1/plot1.png',width=480,height=480,units='px')
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Close off graphic device
x<-dev.off()