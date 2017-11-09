plot4 <- function() {
     # This code is part of Charles Breeden's submission for Assignment #1 of the Exploratory
     # Data Analysis course on Coursera
     
     # The purpose of this function is to import data on household power consumption 
     # from a text file, create four line graphs in a 2x2 grid, and save the file as a PNG image 
     
     # Read the data text file
     pwr <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")
     
     # Create a date variable, bind with the existing data set and subset Feb. 1 & 2  
     DateTime <- strptime(with(pwr, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
     pwr <- cbind(DateTime, pwr)
     pwrfeb <- subset(pwr, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00")
     
     # Add four columns, one for each graph
     par(mfrow = c(2, 2))
     
     # Create the first graph
     x <- pwrfeb$DateTime
     y <- as.numeric(pwrfeb$Global_active_power)
     plot(x, y, type = "l", xlab = "", ylab = "Global Active Power", main = NULL)
     
     # Create the second graph
     y <- as.numeric(pwrfeb$Voltage)
     plot(x, y, type = "l", xlab = "datetime", ylab = "Voltage", main = NULL)
     
     # Create the third graph
     y <- with(pwrfeb, cbind(Sub_metering_1, Sub_metering_2, Sub_metering_3))
     plot(x, y[, 1], col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
     points(x , y[, 2], col = "red", type = "l")
     points(x, y[, 3], col = "blue", type = "l")
     lvals <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     cols <- c("black", "red", "blue")
     legend(x = "topright", legend = lvals, pch = c(NA, NA, NA), lty = c(1, 1, 1), col = cols, bty = "n")
     
     # Create the fourth graph
     y <- as.numeric(pwrfeb$Global_reactive_power)
     plot(x, y, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = NULL)
     
     # Reset global mfrow option to default
     par(mfrow = c(1, 1))
     
     # Output graph to a PNG file
     dev.copy(png, file = "plot4.png")   
     dev.off()
     
     # Return the February subsetted data
     pwrfeb
}