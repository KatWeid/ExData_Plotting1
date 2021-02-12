library(datasets)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/Documents/Coursera/Exploratory_Data_Analysis/zipfile.zip", method = "curl")
unzip("~/Documents/Coursera/Exploratory_Data_Analysis/zipfile.zip")

householdPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subset_HPC <- subset(householdPowerConsumption,  householdPowerConsumption$Date == "2007-02-01" | householdPowerConsumption$Date == "2007-02-02")
activePower <- as.numeric(as.character(subset$Global_active_power))

hist(activePower, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.copy(png, file = "plot1.png")
dev.off()