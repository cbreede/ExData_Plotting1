plot3 <- function() {
     # This code is part of Charles Breeden's submission for Assignment #1 of the Exploratory
     # Data Analysis course on Coursera
     
     # The purpose of this function is to import data on household power consumption 
     # from a text file, create a line graph of three submetering variables
     # and save the file as PNG image 
     
     # Read the data text file
     pwr <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")

     # Create a date variable, bind with the existing data set and subset Feb. 1 & 2  
     DateTime <- strptime(with(pwr, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
     pwr <- cbind(DateTime, pwr)
     pwrfeb <- subset(pwr, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00")

     # Set the x and y variables for the line graph 
     x <- pwrfeb$DateTime
     y <- with(pwrfeb, cbind(Sub_metering_1, Sub_metering_2, Sub_metering_3))

     # Create the line graph
     plot(x, y[, 1], col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
     points(x, y[, 2], col = "red", type = "l")
     points(x, y[, 3], col = "blue", type = "l")
     lvals <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     cols <- c("black", "red", "blue")
     legend(x = "topright", legend = lvals, pch = c(NA, NA, NA), lty = c(1, 1, 1), col = cols)
     
     # Save graph as PNG file
     dev.copy(png, file = "plot3.png")   
     dev.off()
     
     # Return the February subsetted data
     pwrfeb
}