##Student: Ahmed Mustakim 
##Course: exdata-004
##Date: July12, 2014
##Program: plot2.R
##Purpose: Produce plot2.png plot using the Electric Power Consumption data from
##          UC Irvine Machine Learning Repository

plot2 <- function ( filename = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ) {
    #download zip file and read into temporary table x
    temp <- tempfile()
    download.file(filename, temp)
    x <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",na.strings="?" )
    unlink(temp)
    
    #extract 2/1/2007 and 2/2/2007 data into a new table dat
    dat <- x[which(x$Date == "1/2/2007" | x$Date == "2/2/2007"),]
    
    #data type conversions
    dat$DateTime <- as.POSIXlt(strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"))
    dat$Global_active_power <- as.numeric(dat$Global_active_power)
    
    #plot line plot of Global Active Power vs days and save to png file
    png(filename = "plot2.png", width=480, height=480)
    plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
    
}