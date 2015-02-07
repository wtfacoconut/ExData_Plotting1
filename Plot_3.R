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

png("Plot_3.png")
    plot3 <- function(){
    plot(myDat$Date, myDat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
    par(new=T)
    plot(myDat$Date, myDat$Sub_metering_2, type = "l", col="red", xlab = "", ylab = "", xaxt = 'n', yaxt = 'n', ylim=c(0,37) )
    par(new=T)
    plot(myDat$Date, myDat$Sub_metering_3, type = "l", col="blue", xlab = "", ylab = "", xaxt = 'n', yaxt = 'n', ylim=c(0,40))
    par(new=F)
    legend("topright", lty = 1, lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c(1,2,4), cex=0.75)
}
plot3()
dev.off()