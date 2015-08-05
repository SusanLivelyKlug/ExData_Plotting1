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

# Plot 3
#
# X :  Thur, Fri, Sat
# Y : Energy sub metering
# type : line
# legend: black line Sub_metering_1,
#    red line Sub_metering_2, blue line Sub_metering_3
df$Date <- as.Date(dmy(df$Date))

df$date_time <- ymd_hms( paste(df$Date, df$Time) )

with( df,
        plot(as.POSIXct(date_time), Sub_metering_1,
          type="l", xlab="", ylab="Energy sub metering"))
with( df, lines(as.POSIXct(date_time), Sub_metering_2, col="red"))
with( df, lines(as.POSIXct(date_time), Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()


