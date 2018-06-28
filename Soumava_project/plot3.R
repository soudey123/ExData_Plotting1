
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

##plot 3
with(elec_data,{plot(Sub_metering_1~elec_data$date_time, type = "l", 
     xlab="", ylab="Global Active Power (kilowatts)")
     lines(Sub_metering_2~elec_data$date_time,col='red')
     lines(Sub_metering_3~elec_data$date_time,col='blue')
})

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lty=1, lwd=2, cex=0.4)
     
    

## Saving to file
dev.copy(png, file="C:/Users/soudey/Documents/ExData_Plotting1-master/plot3.png", height=500, width=500)
dev.off()

