library(dplyr)
library(lubridate)

df <- read.delim("household_power_consumption.txt",header = TRUE, sep = ";")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df<-df%>%mutate(Date_Time=dmy_hms(paste(df_time$Date,df_time$Time)))
df <- df[df$Date_Time>=ymd('2007-02-01') & df$Date_Time < ymd('2007-02-03'),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

png(filename="plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(df,plot(Date_Time,Global_active_power,type = "l",lty="solid",xlab="",ylab="Global Active Power (kilowatts)"))
with(df,plot(Date_Time,Voltage,type = "l",lty="solid",xlab="datetime",ylab="Voltage"))
plot(df$Date_Time,df$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
points(df$Date_Time,df$Sub_metering_1,type="l",lty="solid",col="black")
points(df$Date_Time,df$Sub_metering_2,type="l",lty="solid",col="red")
points(df$Date_Time,df$Sub_metering_3,type="l",lty="solid",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty='solid',col=c("black","red","blue"),bty = "n")
with(df,plot(Date_Time,Global_reactive_power,type = "l",lty="solid",xlab="datetime",ylab="Voltage"))
dev.off()
