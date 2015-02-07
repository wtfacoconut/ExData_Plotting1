# Plot 1
fileCon <- file("household_power_consumption.txt")
open(fileCon)
myDat <- read.csv(fileCon, header = T, nrows = 1, sep = ";")
myDat <- myDat[-1,]
myDat <- rbind(myDat, read.csv(fileCon, col.names = names(myDat), skip = 66634, nrows = (69514-66634), sep = ";"))
close.connection(fileCon)

png("Plot_1.png")
plot1 <- function(){
    hist(myDat$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
}
plot1()
dev.off()