#Script plot3.R.  Will read in the file household_power_consumption.txt from
#the current directory and will draw 3 line graphs of SUb_metering_1,  
#SUb_metering_2, and SUb_metering_3 over time

#Read in and split the data into a data frame
data <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Convert the date string into a Date() class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the desired dates
data <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02", ]

#Combine Date and Time and convert them into POSIXlt time class
data$TD <-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Open a png graphic file device with the desired size
png(filename="plot3.png",width=480, height=480)

#Create a plot of Sub_metering_1 and add the Y label.  Also added a Y range
#since on the default range was not identical to assignment on my system
with(data, plot(TD,Sub_metering_1, type="l",
                ylab="Energy sub metering",
                xlab="", ylim=c(0,38)))

#Add colored Sub_metering_2 and Sub_metering_3 to the plot
lines(data$TD, data$Sub_metering_2, col="red")
lines(data$TD, data$Sub_metering_3, col="blue")

#Add a legend to the plot
legend("topright",bty="o", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))

#Close the PNG device
dev.off()
