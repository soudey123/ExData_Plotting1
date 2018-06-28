
## Loading the dataset

elec_data <- read.delim("C:/Users/soudey/Documents/ExData_Plotting1-master/household_power_consumption.txt",header = TRUE,sep = ";" ,na.strings = "?")

##change the date format

elec_data$Date <- as.Date(elec_data$Date,format = "%d/%m/%Y")

##subset the data

elec_data <- subset(elec_data, elec_data$Date >= "2007-02-01" & elec_data$Date <= "2007-02-02")

elec_data$Global_active_power <- as.numeric(elec_data$Global_active_power)

##Convert date & Time

Temp_date <- paste(elec_data$Date,elec_data$Time)
elec_data$date_time <- as.POSIXct(Temp_date)

##plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(elec_data, {
  plot(Global_active_power~elec_data$date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~elec_data$date_time, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~elec_data$date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~elec_data$date_time,col='Red')
  lines(Sub_metering_3~elec_data$date_time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",cex=0.4,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~elec_data$date_time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})



## Saving to file
dev.copy(png, file="C:/Users/soudey/Documents/ExData_Plotting1-master/plot4.png", height=500, width=500)
dev.off()

