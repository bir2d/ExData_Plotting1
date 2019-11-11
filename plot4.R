#reading data from file
all_data<- read.csv("household_power_consumption.txt", sep  =";")
#transform date as date type
all_data$Date<- as.Date(all_data$Date,format = "%d/%m/%Y") 
#filter days of data
filter_data<- subset(all_data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
filter_data$Date_Time<-  paste(filter_data$Date ,filter_data$Time)
filter_data$Date_Time <- strptime(filter_data$Date_Time,format = "%Y-%m-%d %H:%M:%S")

#save plot
png(file="plot4.png", width=480, height=480)
#create plot
par(mfrow=c(2,2))
plot(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Global_active_power)),  type="l",xlab = "",ylab="Global Active Power")
plot(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Voltage)),  type="l",xlab = "datetime",ylab="Voltage")
plot(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Sub_metering_1)),  type="l",xlab = "",ylab="Energy sub metering")
lines(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Sub_metering_2)),col="red")
lines(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Sub_metering_3)),col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1)
plot(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Global_reactive_power)),  type="l",xlab = "datetime",ylab="Global_reactive_power")

#save plot

dev.off ()

