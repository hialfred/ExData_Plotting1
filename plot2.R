#### plot2

library(dplyr)
library(lubridate)

#load data
data <- read.table("household_power_consumption.txt", na.string ="?", sep=";", header=T, stringsAsFactors = FALSE)

#subset and format dates
data <- data %>%
  filter( Date=="1/2/2007" | Date=="2/2/2007" )  %>%
  mutate( datetime=dmy_hms(paste(Date,Time)) )  %>%
  tbl_df()  %>% 
  print

#plot2
png("plot2.png", width = 480, height = 480)
with(data, plot(datetime, 
                Global_active_power,
                type = "l",
                xlab = "",
                ylab="Global Active Power (kilowatts)"
                )
     )
dev.off()
