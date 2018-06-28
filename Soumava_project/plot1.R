
## Loading the dataset

elec_data <- read.delim("C:/Users/soudey/Documents/ExData_Plotting1-master/household_power_consumption.txt",header = TRUE,sep = ";" ,na.strings = "?")

##change the date format

elec_data$Date <- as.Date(elec_data$Date,format = "%d/%m/%Y")

##subset the data

elec_data <- subset(elec_data, elec_data$Date >= "2007-02-01" & elec_data$Date <= "2007-02-02")

elec_data$Global_active_power <- as.numeric(elec_data$Global_active_power)

##plot 1
hist(elec_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="C:/Users/soudey/Documents/ExData_Plotting1-master/plot1.png", height=480, width=480)
dev.off()

