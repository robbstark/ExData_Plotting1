#Script plot4.R.  Will read in the file household_power_consumption.txt from
#the current directory and will draw 4 different graphs in two rows

#Read in and split the data into a data frame
data <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Convert the date string into a Date() class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the desired dates
data <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02", ]

#Combine Date and Time and convert them into POSIXlt time class
data$TD <-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Open a png graphic file device with the desired size
png(filename="plot4.png",width=480, height=480)

#Set the configuration of multiple plots, 2 X 2, filled one row at a time
par(mfrow=c(2,2))

#First the histogram of Global_active_power and anotate the y label
with(data, plot(TD,Global_active_power, type="l",
                ylab="Global Active Power",
                xlab=""))

#second Plot Votage usage against time usage, label X and Y Axis
with(data, plot(TD,Voltage, type="l",
                ylab="Voltage",
                xlab="datetime"))

#Third Plot Sub_metering_1, 2, and 3 against time and annotate and add legend
with(data, plot(TD,Sub_metering_1, type="l",
                ylab="Energy sub metering",
                xlab="", ylim=c(0,38)))
lines(data$TD, data$Sub_metering_2, col="red")
lines(data$TD, data$Sub_metering_3, col="blue")
legend("topright", bty="n" ,legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))

#Fourth plot the Global_reactive_power against time
with(data, plot(TD,Global_reactive_power, type="l",
                xlab="datetime"))

#Close the PNG device
dev.off()
