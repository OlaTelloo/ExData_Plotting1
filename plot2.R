library(tidyverse)

txt_file <- read.table("household_power_consumption.txt",
                       sep = ";",
                       header = TRUE)

sub_file <- txt_file %>%
  mutate (Date = as.Date(Date, "%d/%m/%Y"),
          Global_active_power = as.numeric(Global_active_power)) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

test_df <- sub_file %>%
  mutate(DateTime =  as.POSIXct(paste(Date, Time))) %>%
  arrange(DateTime)


png(file="plot2.png", width = 480, height = 480)

plot(test_df$DateTime, test_df$Global_active_power, type = "l", lty = 1, ann=FALSE)
title(xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()



