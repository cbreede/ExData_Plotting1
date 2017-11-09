plot1 <- function() {
     # This code is part of Charles Breeden's submission for Assignment #1 of the Exploratory
     # Data Analysis course on Coursera
     
     # The purpose of this function is to import data on household power consumption 
     # from a text file, create a histogram of global active power and save the file as a PNG image 

     # Read the data text file
     pwr <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")
     
     # Create a date variable, bind with the existing data set and subset Feb. 1 & 2  
     DateTime <- strptime(with(pwr, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
     pwr <- cbind(DateTime, pwr)
     pwrfeb <- subset(pwr, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00")
     
     # Set the x and y variables for the line graph 
     x <- as.numeric(pwrfeb$Global_active_power)
     
     # Create the histogram graph
     hist(x, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
     
     # Output graph to a PNG file
     dev.copy(png, file = "plot1.png")   
     dev.off()
     
     # Return the February subsetted data
     pwrfeb
}