# Presuming the file has been downloaded and saved in the working directory - using file.info() to check the size.
file.info("household_power_consumption.txt")
# Reading file into R, setting header to TRUE and separator sep to ;
HouseholdPower <- read.table("household_power_consumption.txt", header = TRUE, sep= ";")
# check classes of columns ...
lapply(HouseholdPower, class)
# ... and convert Date (factor) into Date (Date)
HouseholdPower$Date <- as.Date(HouseholdPower$Date, format="%d/%m/%Y")
# Filter data for the given timeframe
FebruaryPower <- HouseholdPower[HouseholdPower$Date == "2007-02-01" | HouseholdPower$Date == "2007-02-02",]
# change other variables from factors to numerics
FebruaryPower$Global_active_power <- as.numeric(as.character(FebruaryPower$Global_active_power))
FebruaryPower$Global_reactive_power <- as.numeric(as.character(FebruaryPower$Global_reactive_power))
FebruaryPower$Voltage <- as.numeric(as.character(FebruaryPower$Voltage))
FebruaryPower$Sub_metering_1 <- as.numeric(as.character(FebruaryPower$Sub_metering_1))
FebruaryPower$Sub_metering_2 <- as.numeric(as.character(FebruaryPower$Sub_metering_2))
FebruaryPower$Sub_metering_3 <- as.numeric(as.character(FebruaryPower$Sub_metering_3))
# combine Date & Time into new column to facilitate linegraph plotting
FebruaryPower <- transform(FebruaryPower, DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# check classes again
lapply(FebruaryPower, class)
# create fourth plot - combination of plots 1 & 3 with added plots for Voltage and Reactive Power
# first specify layout: 2 rows x 2 columns
par(mfrow=c(2,2))
# plot graph 1
plot(FebruaryPower$DateTime, FebruaryPower$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# plot linegraph for Voltage
plot(FebruaryPower$DateTime, FebruaryPower$Voltage, type="l", ylab="Voltage", xlab="datetime")
# plot graph 3 as before
plot(FebruaryPower$DateTime, FebruaryPower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(FebruaryPower$DateTime, FebruaryPower$Sub_metering_2,col="red")
lines(FebruaryPower$DateTime, FebruaryPower$Sub_metering_3,col="blue")
# remove box around legend and make it fit
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
# plot Global reactive power
plot(FebruaryPower$DateTime, FebruaryPower$Global_reactive_power, type="l", ylab="Global Reactive Power", xlab="datetime")
# copy graph to png
dev.copy(png, file="plot4.png", width=480, height=480)
# turn device off
dev.off()
