library(lubridate)
library(dplyr)

fname <- "./household_power_consumption.txt"

#
# data from the dates 2007-02-01 and 2007-02-02
# 418;234.840;18.400;0.000;1.000;17.000
#  Date.Time.Global_active_power.Global_reactive_power.
#     Voltage.Global_intensity.Sub_metering_1.Sub_metering_2.Sub_metering_3

data <- read.csv(fname, sep=";", na.strings="?")

df <- data[dmy(data$Date) == ymd("2007-02-01") | dmy(data$Date) == ymd("2007-02-02"),]

# Plot 1
# Title "Global Active Power
# X : Global Active Power (kilowatts)
# Y : Frequency
# Red filled histogram

hist(df$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="red" )

dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()


