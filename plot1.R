library(tidyverse)

txt_file <- read.table("household_power_consumption.txt",
                       sep = ";",
                       header = TRUE)

sub_file <- txt_file %>%
  mutate (Date = as.Date(Date, "%d/%m/%Y"),
          Global_active_power = as.numeric(Global_active_power),
          DateTime =  as.POSIXct(paste(Date, Time))) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
  arrange(DateTime)


png(file="plot1.png", width = 480, height = 480)

hist(sub_file$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
