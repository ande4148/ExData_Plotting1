mydata <- read.csv("coursedata/household_power_consumption.txt", sep = ";", header=TRUE)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$dat <- with(mydata, paste(mydata$Date, mydata$Time))
mydata$dat <- strptime(mydata$dat, "%Y-%m-%d %H:%M:%S")
date01 <- subset(mydata, mydata$Date == "2007-02-01")
date02 <- subset(mydata, mydata$Date == "2007-02-02")
df <- rbind(date01, date02)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Global_intensity <- as.numeric(as.character(df$Global_intensity))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

png(filename = "plot4.png")

par(mfrow = c(2,2))
plot(df$dat, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(df$dat, df$Voltage, type = "l", xlab = "datetime",ylab = "Voltage")
plot(df$dat, df$Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering")
lines(df$dat, df$Sub_metering_2, type = "l", col = "red", xlab = "")
lines(df$dat, df$Sub_metering_3, type = "l", col = "blue", xlab = "")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = .5,, lty = c(1,1), col = c("black",  "red", "blue"),  bty = "n")
plot(df$dat, df$Global_reactive_power, type = "l", 
     xlab = "datetime",ylab = "Global_reactive_time")

dev.off()

