##Student: Ahmed Mustakim 
##Course: exdata-004
##Date: July12, 2014
##Program: plot1.R
##Purpose: Produce plot1.png plot using the Electric Power Consumption data from
##          UC Irvine Machine Learning Repository

plot1 <- function ( filename = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ) {
    #download zip file and read into temporary table x
    temp <- tempfile()
    download.file(filename, temp)
    x <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";",na.strings="?" )
    unlink(temp)
    
    #extract 2/1/2007 and 2/2/2007 data into a new table dat
    dat <- x[which(x$Date == "1/2/2007" | x$Date == "2/2/2007"),]
    
    #data type conversions
    dat$Date <- as.Date(strptime(dat$Date, "%d/%m/%Y"))
    dat$Global_active_power <- as.numeric(dat$Global_active_power)
    
    #plot histogram of Global Active Power and save to png file
    png(filename = "plot1.png", width=480, height=480)
    hist(dat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
    dev.off()
    
}