## Clean up data

##setwd("C:/Users/justyna/Documents/Work/Data Science/")

householdPower <- read.table("household_power_consumption.txt", header = T, sep = ";")
householdPower$Time <- strptime(paste(householdPower$Date,householdPower$Time), "%d/%m/%Y %H:%M:%S")
as.POSIXlt(householdPower$Time)
householdPower$Date <- as.Date(householdPower$Date, format = "%d/%m/%Y")

householdPower01 <- subset(householdPower, Date== "2007-02-01")
householdPower02 <- subset(householdPower, Date== "2007-02-02")
mergedHouseholdPower <- rbind(householdPower01, householdPower02)

mergedHouseholdPower$Global_active_power <- as.numeric(as.character(mergedHouseholdPower$Global_active_power))

## Plot 1

png(file="plot1.png",width=480,height=480)
hist(mergedHouseholdPower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


