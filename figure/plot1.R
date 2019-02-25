plot1 <- function(){
  # Rough estimate confirms we can load the 126MB file.
  # Below process loads the file into household power consumption with dates 2007-02-01 and 2007-02-02
  library(sqldf)
  hhpcsubsetdf <- read.csv.sql("C:/Darpan/DataScience/Course4/Week1/household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")
  #Convert character value to Date class
  hhpcsubsetdf$Date <- as.Date(hhpcsubsetdf$Date, "%d/%m/%Y")
  #Convert character value to Time class
  library(chron)
  hhpcsubsetdf$Time  <- chron(times=hhpcsubsetdf$Time)
  #Create a PNG file with 480/480 Pixel and save it using a plot(histogram)
  png(filename = "C:/Darpan/DataScience/Course4/Week1/plot1.png",width = 480, height = 480)
  hist(hhpcsubsetdf$Global_active_power, col="RED", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}
plot1()