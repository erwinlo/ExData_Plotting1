## Download data and extract it.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "dataset.zip", method = "curl")
unzip("dataset.zip", overwrite = TRUE)

# read data into data.table dt
library(data.table)
dt <- fread("household_power_consumption.txt")

# subset data for specific dates only
dt <- subset(dt, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Global_active_power column to numeric
dt$Global_active_power <- as.numeric(dt$Global_active_power)

# plot histogram to png file
png(filename = "plot1.png", width = 480, height = 480)
hist(dt$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
