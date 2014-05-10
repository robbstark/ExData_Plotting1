#Script plot2.R.  Will read in the file household_power_consumption.txt from
#the current directory and will draw a line graph of Global_active_power over
#time

#Read in and split the data into a data frame
data <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Convert the date string into a Date() class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the desired dates
data <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02", ]

#Combine Date and Time and convert them into POSIXlt time class
data$TD <-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Open a png graphic file device with the desired size
png(filename="plot2.png",width=480, height=480)

#Plot a line graph of time vs Global_active_power and label y axis
with(data, plot(TD,Global_active_power, type="l",
                ylab="Global Active Power (Kilowatts)",
                xlab=""))

#Close PNG device
dev.off()
