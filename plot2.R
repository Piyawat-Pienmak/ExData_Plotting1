library(dplyr)
library(lubridate)

df <- read.delim("household_power_consumption.txt",header = TRUE, sep = ";")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df<-df%>%mutate(Date_Time=dmy_hms(paste(df_time$Date,df_time$Time)))
df <- df[df$Date_Time>=ymd('2007-02-01') & df$Date_Time < ymd('2007-02-03'),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

png(filename="plot2.png",width = 480, height = 480, units = "px")
with(df,plot(Date_Time,Global_active_power,type = "l",lty="solid",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()