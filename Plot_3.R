# Plot_3
library(lubridate)

fileCon <- file("household_power_consumption.txt")
open(fileCon)
myDat <- read.csv(fileCon, header = T, nrows = 1, sep = ";")
myDat <- myDat[-1,]
myDat <- rbind(myDat, read.csv(fileCon, col.names = names(myDat), skip = 66634, nrows = (69514-66634), sep = ";", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric")))
close.connection(fileCon)


myDat$Date <- with (myDat, paste(Date,Time, sep = " "))
dow <- function(x) dmy_hms(x)
myDat$Date <- dow(myDat$Date)