#### plot1

#load data
data <- read.table("household_power_consumption.txt", na.string ="?", sep=";", header=T, stringsAsFactors = FALSE)

#subset and format dates
data <- data %>%
  filter( Date=="1/2/2007" | Date=="2/2/2007" )  %>%
  mutate( datetime=dmy_hms(paste(Date,Time)) )  %>%
  tbl_df()  %>% 
  print

#plot1
png("plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, 
                col="red", 
                main="Global Active Power", 
                xlab="Global Active Power (kilowatts)",
                xlim=c(0,6), ylim=c(0,1200)
                )
)
dev.off()

