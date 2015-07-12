data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_sub <- subset(data, as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007")
data_sub2 <- as.POSIXct(paste(data_sub$Date, data_sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

plot(data_sub[,3] ~ data_sub2, type="l", pch=".", xlab="", ylab="Global Active Power")
plot(data_sub[,5] ~ data_sub2, type="l", pch=".", xlab="datetime", ylab="Voltage")

plot(data_sub[,7] ~ data_sub2, type="l", pch=".", xlab="", ylab="Energy Sub Metering")
lines(data_sub[,8] ~ data_sub2, col="red")
lines(data_sub[,9] ~ data_sub2, col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), cex=0.7, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data_sub[,4] ~ data_sub2, type="l", pch=".", xlab="datetime", ylab="Global_Reactive_Power")

dev.copy(png, file = "Plot4.png",height=480, width=480)
dev.off()