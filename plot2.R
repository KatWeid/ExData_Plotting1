library(datasets)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/Documents/Coursera/Exploratory_Data_Analysis/zipfile.zip", method = "curl")
unzip("~/Documents/Coursera/Exploratory_Data_Analysis/zipfile.zip")

householdPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subset_HPC <- subset(householdPowerConsumption,  householdPowerConsumption$Date == "1/2/2007" | householdPowerConsumption$Date == "2/2/2007")
date_time <- strptime(paste(subset_HPC$Date, subset_HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activePower <- as.numeric(subset_HPC$Global_active_power)

plot(date_time, activePower,
     type = "l",
     col ="black",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "")

dev.copy(png, file = "plot2.png")
dev.off()