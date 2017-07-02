# Presuming the file has been downloaded and saved in the working directory - using file.info() to check the size.
file.info("household_power_consumption.txt")
# Reading file into R, setting header to TRUE and separator sep to ;
HouseholdPower <- read.table("household_power_consumption.txt", header = TRUE, sep= ";")
# check classes of columns ...
lapply(HouseholdPower, class)
# ... and convert Date (factor) into Date (Date)
HouseholdPower$Date <- as.Date(HouseholdPower$Date, format="%d/%m/%Y")
# Filter data for the given timeframe
FebruaryPower <- HouseholdPower[HouseholdPower$Date >= "2007-02-01" & HouseholdPower$Date <= "2007-02-02",]
# change other variables from factors to numerics
FebruaryPower$Global_active_power <- as.numeric(as.character(FebruaryPower$Global_active_power))
FebruaryPower$Global_reactive_power <- as.numeric(as.character(FebruaryPower$Global_reactive_power))
FebruaryPower$Voltage <- as.numeric(as.character(FebruaryPower$Voltage))
FebruaryPower$Sub_metering_1 <- as.numeric(as.character(FebruaryPower$Sub_metering_1))
FebruaryPower$Sub_metering_2 <- as.numeric(as.character(FebruaryPower$Sub_metering_2))
FebruaryPower$Sub_metering_3 <- as.numeric(as.character(FebruaryPower$Sub_metering_3))
# check classes again
lapply(FebruaryPower, class)
# create first plot - histogram
# using hist() with FebruaryPower$Global_active_power as data, main to set the overall title, xlab to set subtitle for the x-axis, and col for colour. I went for purple just to be different!
hist(FebruaryPower$Global_active_power,  main="Global Active Power", xlab="Global Active Power (kilowatts)", col="purple")