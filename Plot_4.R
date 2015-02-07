# Plot_4

library(lubridate)
source("Plot_2.R")
source("Plot_3.R")

fileCon <- file("household_power_consumption.txt")
open(fileCon)
myDat <- read.csv(fileCon, header = T, nrows = 1, sep = ";")
myDat <- myDat[-1,]
myDat <- rbind(myDat, read.csv(fileCon, col.names = names(myDat), skip = 66634, nrows = (69514-66634), sep = ";", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")))
close.connection(fileCon)

myDat$Date <- with (myDat, paste(Date,Time, sep = " "))
dow <- function(x) dmy_hms(x)
myDat$Date <- dow(myDat$Date)

plot4_1 <- function(){
    plot(myDat$Date, myDat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
}

plot4_2 <- function(){
    plot(myDat$Date, myDat$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
}

plot4 <- function(){
    par(mfrow = c(2,2))
    plot2()
    plot4_1()
    plot3()
    plot4_2()
}

png("Plot_4.png")
plot4()
dev.off()
