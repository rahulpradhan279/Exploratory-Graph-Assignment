plot1 <-function {
  
  library("duplyr")
  library("lubridate")
  
  data<-read.csv("C:/Users/NTBL/Documents/R/plot/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
  data<-tbl_df(data)
  data$Date<-dmy(data$Date)
  datafinal<-data[data$Date>='2007-02-01' & data$Date<='2007-02-02',]
  png("plot1.png", width=480, height=480)
  hist(datafinal$Global_active_power,main = "Global Active Power" ,col = "Red",xlab = "Global Active Poer(kilowatts)",ylab = "Frequency")
  dev.off()
  
}