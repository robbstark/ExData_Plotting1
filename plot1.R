#Script plot1.R.  Will read in the file household_power_consumption.txt from
#the current directory and will draw a histogram of Global_active_power

#Read in and split the data into a data frame
data <- read.table(file="household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Convert the date string into a Date() class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the desired dates
data <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02", ]

#Open a png graphic file device with the desired size
png(filename="plot1.png", width=480, height=480)

#Draw the histogram. Color and annotate as necessary
with(data, hist(Global_active_power,
                main="Global Active Power", 
                xlab="Global Active Power (Kilowatts)", 
                col="red"))

#close the PNG device
dev.off()
