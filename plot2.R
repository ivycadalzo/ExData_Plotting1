alldata <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE)
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")
subdata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")
subdata <- subdata[complete.cases(subdata),]

date_time <- paste(subdata$Date, subdata$Time)
date_time <- setNames(date_time, "Date_Time")
subdata <- cbind(date_time, subdata)
subdata$date_time <- as.POSIXct(date_time)

plot(subdata$Global_active_power ~ subdata$date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()