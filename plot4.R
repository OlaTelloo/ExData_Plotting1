library(tidyverse)

txt_file <- read.table("household_power_consumption.txt",
                       sep = ";",
                       header = TRUE)

sub_file <- txt_file %>%
  mutate (Date = as.Date(Date, "%d/%m/%Y"),
          Global_active_power = as.numeric(Global_active_power)) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")


test2 <- sub_file %>%
  mutate(DateTime =  as.POSIXct(paste(Date, Time))) %>%
  arrange(DateTime)


png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(test2$DateTime, test2$Global_active_power, type = "l", lty = 1, ann=FALSE)

plot(test2$DateTime, test2$Voltage, type = "l", lty = 1, ann=FALSE)
title(xlab = "datetime", ylab = "Voltage")

plot(test2$DateTime, test2$Sub_metering_1, type = "l", lty = 1, ann=FALSE)

points(test2$DateTime, test2$Sub_metering_2, type = "l", col = "orange", lty = 1)

points(test2$DateTime, test2$Sub_metering_3, type = "l", lty = 1, ann=FALSE, col = "blue")

title(ylab = "Energy sub metering")
legend("topright", lty = c(1, 1, 1), col = c("black", "orange", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.5)


plot(test2$DateTime, test2$Global_reactive_power, type = "l", lty = 1, ann=FALSE)
title(xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
