#######################################################
### Exploratory Data Analysis: Course Project 1     ###
### File: plot4.R                                   ###
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
### Plot 4 as .png ###
######################

# Convert to string and then to numeric to preserve exact values of factor variable
x <- as.numeric(as.character(data$Global_active_power))
z <- as.numeric(as.character(data$Voltage))
a <- as.numeric(as.character(data$Global_reactive_power))
x1 <- data$Sub_metering_1
x2 <- data$Sub_metering_2
x3 <- data$Sub_metering_3
y <- data$Date

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(5,4,3,2))
plot (y,x,type="l",xlab="",ylab="Global Active Power")
plot (y,z,type="l",xlab="datetime",ylab="Voltage")
plot (y,x1,type="l",xlab="",ylab="Energy sub metering",yaxp=c(0,30,3))
lines(y,x2,col="red")
lines(y,x3,col="blue")
legend(
    "topright",
    legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    col=c("black","red","blue"),
    lty=c(1,1,1),
    bg="transparent",
    y.intersp = 0.75, # reduce space between legend elements
    cex=0.75, # scales legend down
    bty="n" # removes border
)
plot (y,a,type="l",xlab="datetime",ylab="Global_reactive_power")   
dev.off()        