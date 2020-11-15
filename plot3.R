alldata <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE)
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")
subdata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")
subdata <- subdata[complete.cases(subdata),]

date_time <- paste(subdata$Date, subdata$Time)
date_time <- setNames(date_time, "Date_Time")
subdata <- cbind(date_time, subdata)
subdata$date_time <- as.POSIXct(date_time)

with(subdata, {
  plot(Sub_metering_1 ~ date_time, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ date_time,col="red")
  lines(Sub_metering_3 ~ date_time,col="blue")
})

legend("topright", inset=0.02, col=c("black", "red", "blue"), lwd=c(1,1,1), bty="n",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()