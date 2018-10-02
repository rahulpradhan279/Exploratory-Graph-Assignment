plot2 <-function {
  
  library("duplyr")
  library("lubridate")
  
  data<-read.csv("C:/Users/NTBL/Documents/R/plot/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
  data<-tbl_df(data)
  data$Date<-dmy(data$Date)
  datafinal<-data[data$Date>='2007-02-01' & data$Date<='2007-02-02',]
  datafinal["datetime"]<-NA
  datafinal$datetime<-paste(datafinal$Date,datafinal$Time)
  datafinal$datetime<-ymd_hms(datafinal$datetime)
  png("plot2.png", width=480, height=480)
  plot(x=datafinal$datetime,y=datafinal$Global_active_power,xlab = "",ylab = "Global Active Power(kilowatts)",type="l")
  dev.off()
  
}