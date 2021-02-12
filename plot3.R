library(datasets)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/Documents/Coursera/Exploratory_Data_Analysis/zipfile.zip", method = "curl")
unzip("~/Documents/Coursera/Exploratory_Data_Analysis/zipfile.zip")

householdPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subset_HPC <- subset(householdPowerConsumption,  householdPowerConsumption$Date == "1/2/2007" | householdPowerConsumption$Date == "2/2/2007")

date_time <- strptime(paste(subset_HPC$Date, subset_HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subset_HPC$Sub_metering_1)
subMetering2 <- as.numeric(subset_HPC$Sub_metering_2)
subMetering3 <- as.numeric(subset_HPC$Sub_metering_3)

png(file = "plot3.png")

plot(date_time, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0, 38))
lines(subMetering1, type = "l", col ="black")
lines(date_time, subMetering2, type = "l", col = "red")
lines(date_time, subMetering3, type = "l", col = "blue")
legend("topright", legend= c("Sub_merting_1", "Sub_merting_2", "Sub_merting_3"), col = c("black", "red", "blue"), text.col = "black", lwd = "1", cex = 0.8)

dev.off()