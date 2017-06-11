#######################################################
### Exploratory Data Analysis: Course Project 1     ###
### File: plot1.R                                   ###
### Author: Thomas Pfab                             ###
#######################################################

####################
### Reading data ###
####################

# Read data and create copy to work with
setwd("F:/RStudioWD")
data = read.table("household_power_consumption.txt",sep=";",header=TRUE)
data2 <- data

# Create variable combining date and time
datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

# Set system time to display English labels for days
Sys.setlocale("LC_TIME", "C")

# Assign Date-variable datetime as POSIXct
data2$Date <- as.POSIXct(datetime)

# Subset only relevant dates and times
data3 <- data2[data2$Date >= as.POSIXct("2007-02-01 00:00:00") & data2$Date < as.POSIXct("2007-02-03 00:00:00"),]
data <- data3[complete.cases(data3),]


######################
### Plot 1 as .png ###
######################

# Convert to string and then to numeric to preserve exact values of factor variable
x <- as.numeric(as.character(data$Global_active_power))

png("plot1.png",width=480,height=480)
par(mfrow=c(1,1),mar=c(5,4,3,2))
hist(x,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()