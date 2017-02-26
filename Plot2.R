Plot2 <- function(){
  png("plot2.png", width = 480, height = 480)
  HPC <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)  ##Read the data into the table
  HPC2<-HPC
  HPC2[,1]<-as.Date(HPC[,1], "%d/%m/%Y") ##Create a new table with the Date variable coverted to date format
  HPC2[,2] <- as.POSIXct(paste(HPC$Date, HPC$Time), format="%d/%m/%Y %H:%M:%S") ##Convert the time variable into a date time
  HPC3 <- HPC2[HPC2$Date=='2007-02-01' | HPC2$Date=='2007-02-02',] ##Create a new table with only entries for 
  HPC3$Global_active_power <- as.numeric(HPC3$Global_active_power)
  plot(HPC3$Time, HPC3$Global_active_power, type="l", ylab="Global Active Power (killowatts)",main="",xlab="")
  dev.off()
  
}