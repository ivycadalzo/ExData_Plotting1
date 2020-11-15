alldata <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE)
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")
subdata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")
subdata <- subdata[complete.cases(subdata),]

hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()