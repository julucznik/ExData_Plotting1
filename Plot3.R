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

##Plot 3
mergedHouseholdPower$Sub_metering_1 <- as.numeric(as.character(mergedHouseholdPower$Sub_metering_1))
mergedHouseholdPower$Sub_metering_2 <- as.numeric(as.character(mergedHouseholdPower$Sub_metering_2))
mergedHouseholdPower$Sub_metering_3 <- as.numeric(as.character(mergedHouseholdPower$Sub_metering_3))


png(file="plot3.png",width=480,height=480)
plot(mergedHouseholdPower$Time, mergedHouseholdPower$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", yaxt = "n")
axis(2, at = c(0,10,20,30), labels = T)
lines(mergedHouseholdPower$Time, mergedHouseholdPower$Sub_metering_2, col = "red")
lines(mergedHouseholdPower$Time, mergedHouseholdPower$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ("black", "red", "blue"))
dev.off()
