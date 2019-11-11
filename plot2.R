#reading data from file
all_data<- read.csv("household_power_consumption.txt", sep  =";")
#transform date as date type
all_data$Date<- as.Date(all_data$Date,format = "%d/%m/%Y") 
#filter days of data
filter_data<- subset(all_data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
filter_data$Date_Time<-  paste(filter_data$Date ,filter_data$Time)
filter_data$Date_Time <- strptime(filter_data$Date_Time,format = "%Y-%m-%d %H:%M:%S")
#save plot
png(file="plot2.png", width=480, height=480)
#create plot
plot(x=filter_data$Date_Time ,y= as.double(as.character(filter_data$Global_active_power)),  type="l",xlab = "",ylab="Global Active Power (Kilowatts)")
#save plot
dev.off ()

