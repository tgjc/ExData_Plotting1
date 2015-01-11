#set working directory
setwd("/Users/theochristian/Dropbox/Coursera/exploratory_data_analysis/Assignment1/ExData_Plotting1")

# load req libraries
library(data.table)
library(lubridate)

# read in data for period 1/2/2007 - 2/2/2007 from source text file
variableClass <- c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('household_power_consumption.txt',header=TRUE,
                              sep=';',na.strings='?', colClasses = variableClass)
powerConsumption <- powerConsumption[powerConsumption$Date=='1/2/2007' | powerConsumption$Date=='2/2/2007',]

# clean data
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(powerConsumption)<-cols
powerConsumption$DateTime<-dmy(powerConsumption$Date)+hms(powerConsumption$Time)
powerConsumption <- powerConsumption[,c(10,3:9)]

# write cleaned data to file new_power_consumption.txt
write.table(powerConsumption,file = 'new_power_consumption.txt', sep = ';', row.names = FALSE)
dir.create('plot 2')

# generate plot
png(filename='plot 2/plot2.png',width=480,height=480,units='px')
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Close off graphic device
x<-dev.off()