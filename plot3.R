plot3 <- function(){
  # Rough estimate confirms we can load the 126MB file.
  # Below process loads the file into household power consumption with dates 2007-02-01 and 2007-02-02
  library(sqldf)
  hhpcsubsetdf <- read.csv.sql("C:/Darpan/DataScience/Course4/Week1/household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")
  
  #Convert character value to Date class
  hhpcsubsetdf$Date <- as.Date(hhpcsubsetdf$Date, "%d/%m/%Y")
  #Convert character value to Time class
  library(chron)
  hhpcsubsetdf$Time  <- chron(times=hhpcsubsetdf$Time)
  #Create a PNG file with 480/480 Pixel and save it using a plot with three variables in x-axis and add legends
  png(filename = "C:/Darpan/DataScience/Course4/Week1/plot3.png",width = 480, height = 480)
  plot(as.POSIXct(paste(hhpcsubsetdf$Date,hhpcsubsetdf$Time)),hhpcsubsetdf$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
  lines(as.POSIXct(paste(hhpcsubsetdf$Date,hhpcsubsetdf$Time)),hhpcsubsetdf$Sub_metering_1,col="black",pch=3)
  lines(as.POSIXct(paste(hhpcsubsetdf$Date,hhpcsubsetdf$Time)),hhpcsubsetdf$Sub_metering_2,col="red",pch=3)
  lines(as.POSIXct(paste(hhpcsubsetdf$Date,hhpcsubsetdf$Time)),hhpcsubsetdf$Sub_metering_3,col="blue",pch=3)
  legend("topright",legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),col = c("BLACK","RED","BLUE"),lty=1:3, cex=0.8)
  dev.off()
  
  
  
  
}
plot3()