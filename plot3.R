#### plot3

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

#plot3
png("plot3.png", width = 480, height = 480)
with(data, plot(datetime, Sub_metering_1, 
                type="l", col="black", 
                xlab="", ylab="Energy sub metering" 
                ) 
     )
with(data, lines(datetime, Sub_metering_2,
                 type="l", col="red"
                 ) 
     )
with(data, lines(datetime, Sub_metering_3,
                 type="l", col="blue"
                 ) 
     )
legend("topright", 
       col=c("black", "red", "blue"), lty=1,  
       legend=paste("Sub_metering_", 1:3, sep=""
                    )
       )
dev.off()

