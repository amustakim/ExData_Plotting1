##Student: Ahmed Mustakim 
##Course: exdata-004
##Date: July12, 2014
##Program: plot3.R
##Purpose: Produce plot3.png plot using the Electric Power Consumption data from
##          UC Irvine Machine Learning Repository

plot3 <- function ( filename = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ) {
    #download zip file and read into temporary table x
    temp <- tempfile()
    download.file(filename, temp)
    x <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",na.strings="?" )
    unlink(temp)
    
    #extract 2/1/2007 and 2/2/2007 data into a new table dat
    dat <- x[which(x$Date == "1/2/2007" | x$Date == "2/2/2007"),]
    
    #data type conversions
    dat$DateTime <- as.POSIXlt(strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
    dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
    dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
    dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)
    
    #plot line plots of Sub meterings vs days and save to png file
    png(filename = "plot3.png", width=480, height=480)
    plot (dat$DateTime , dat$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering" )
    lines (dat$DateTime , dat$Sub_metering_2, type="l", col="red")
    lines (dat$DateTime , dat$Sub_metering_3, type="l", col="blue")
    legend("topright",  lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    
}