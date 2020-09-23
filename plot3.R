## Assume data has been downloaded using plot1.R script

# read data into data.table dt
library(data.table)
dt <- fread("household_power_consumption.txt")

# subset data for specific dates only
dt <- subset(dt, Date == "1/2/2007" | Date == "2/2/2007")

# Combine Date and Time columns into datetime column
dt$datetime <- as.POSIXct(paste(dt$Date, dt$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot lines
png(filename = "plot3.png", width = 480, height = 480)
with(dt, plot(datetime, Sub_metering_1, col = "black", type = "l", xlab = "", 
              ylab = "Energy sub metering"))
with(dt, lines(datetime, Sub_metering_2, col="red"))
with(dt, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()