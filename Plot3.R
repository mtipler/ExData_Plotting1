Plot3 <- function(){
  png("plot3.png", width = 480, height = 480)
  HPC <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)  ##Read the data into the table
  HPC2<-HPC
  HPC2[,1]<-as.Date(HPC[,1], "%d/%m/%Y") ##Create a new table with the Date variable coverted to date format
  HPC2[,2] <- as.POSIXct(paste(HPC$Date, HPC$Time), format="%d/%m/%Y %H:%M:%S") ##Convert the time variable into a date time
  HPC3 <- HPC2[HPC2$Date=='2007-02-01' | HPC2$Date=='2007-02-02',] ##Create a new table with only entries for 
  HPC3$Sub_metering_1 <- as.numeric(HPC3$Sub_metering_1)
  HPC3$Sub_metering_2 <- as.numeric(HPC3$Sub_metering_2)
  HPC3$Sub_metering_3 <- as.numeric(HPC3$Sub_metering_3)
  plot(HPC3$Time, HPC3$Sub_metering_1, type="l", ylab="Energy sub metering",main="",xlab="")
  lines(HPC3$Time, HPC3$Sub_metering_2,col="red")
  lines(HPC3$Time, HPC3$Sub_metering_3,col="blue")  
  legend("topright", col=c("black","blue","red"),lty=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}