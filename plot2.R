## Assume data has been downloaded using plot1.R script

# read data into data.table dt
library(data.table)
dt <- fread("household_power_consumption.txt")

# subset data for specific dates only
dt <- subset(dt, Date == "1/2/2007" | Date == "2/2/2007")

# Combine Date and Time columns into datetime column
dt$datetime <- as.POSIXct(paste(dt$Date, dt$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot line
png(filename = "plot2.png", width = 480, height = 480)
with(dt, plot(datetime, Global_active_power, type = "l", xlab = "", 
              ylab = "Global Active Power (kilowatts)"))
dev.off()