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
# create third plot - linegraph for all sub-meters
# First, create line for sub-metering 1, default in black and set axis labels (x axis by default, y axis = Energy sub metering)
plot(FebruaryPower$DateTime, FebruaryPower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# add second and third line
lines(FebruaryPower$DateTime, FebruaryPower$Sub_metering_2,col="red")
lines(FebruaryPower$DateTime, FebruaryPower$Sub_metering_3,col="blue")
# add a legend in the top-right corner
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
# copy plot to png with specific width & height
dev.copy(png, file="plot3.png", width=480, height=480)
# turn graphic device off
dev.off()
