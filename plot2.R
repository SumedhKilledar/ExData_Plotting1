# Read data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)


#  SAVE PLOT
png("plot2.png", width = 480, height = 480)

plot(data$Datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()