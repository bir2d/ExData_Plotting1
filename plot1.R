#reading data from file
all_data<- read.csv("household_power_consumption.txt", sep  =";")
#transform date as date type
all_data$Date<- as.Date(all_data$Date,format = "%d/%m/%Y") 
#filter days of data
filter_data<- subset(all_data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
#save plot
png(file="plot1.png", width=480, height=480)
#create plot
hist(as.double(as.character(filter_data$Global_active_power)),main="Global Active Power",xlab="Global Active Power (Kilowatts)", col="red",freq = TRUE)
#save plot
dev.off ()

