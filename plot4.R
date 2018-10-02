plot4 <-function {
  
  library("duplyr")
  library("lubridate")
  
  data<-read.csv("C:/Users/NTBL/Documents/R/plot/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
  data<-tbl_df(data)
  data$Date<-dmy(data$Date)
  datafinal<-data[data$Date>='2007-02-01' & data$Date<='2007-02-02',]
  datafinal["datetime"]<-NA
  datafinal$datetime<-paste(datafinal$Date,datafinal$Time)
  datafinal$datetime<-ymd_hms(datafinal$datetime)
  
  #Setting output to  PNG file 
  png("plot4.png", width=480, height=480)
  
  ## dividing the Plot screen to 2 X 2 MAtrix
  par(mfrow=c(2,2))
  
  #Plot 1
  hist(datafinal$Global_active_power,main = "Global Active Power" ,col = "Red",xlab = "Global Active Poer(kilowatts)",ylab = "Frequency")
  
  #plot 2
  plot(datafinal$datetime,datafinal$Voltage,ylab="Voltage",xlab = "DateTime" ,type="l")
  
  #plot 3
    plot(x=datafinal$datetime,y=datafinal$Sub_metering_1,xlab = "",ylab = "Energy Sub Meter",type="l")
  lines(datafinal$datetime,datafinal$Sub_metering_2,col="red")
  lines(datafinal$datetime,datafinal$Sub_metering_3,col="blue")
  legend ("topright",col = c("black","red","blue")
          ,c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty = "n",cex = 0.8)
  
  #plot 4
  plot(datafinal$datetime,datafinal$Global_reactive_power,xlab="DateTime",ylab="Global Reactive Power", type="l")
  
  
  dev.off()
  
}