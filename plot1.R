# Read data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset required dates
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()