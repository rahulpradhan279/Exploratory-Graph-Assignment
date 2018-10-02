plot3 <-function {
  
  library("duplyr")
  library("lubridate")
  
  data<-read.csv("C:/Users/NTBL/Documents/R/plot/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
  data<-tbl_df(data)
  data$Date<-dmy(data$Date)
  datafinal<-data[data$Date>='2007-02-01' & data$Date<='2007-02-02',]
  datafinal["datetime"]<-NA
  datafinal$datetime<-paste(datafinal$Date,datafinal$Time)
  datafinal$datetime<-ymd_hms(datafinal$datetime)
  png("plot3.png", width=480, height=480)
  
  plot(x=datafinal$datetime,y=datafinal$Sub_metering_1,xlab = "",ylab = "Energy Sub Meter",type="l")
  lines(datafinal$datetime,datafinal$Sub_metering_2,col="red")
  lines(datafinal$datetime,datafinal$Sub_metering_3,col="blue")
  legend ("topright",col = c("black","red","blue")
          ,c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.off()
  
}