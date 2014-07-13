## Plot 1 

# Reades file into data frame
fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# Read Relevant Data

febdata<-fulldata[with(fulldata, Date=="1/2/2007"|Date=="2/2/2007"), ]

# Creates Histogram
hist(febdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

#Creates PNG
dev.copy(png, file="plot1.png")
dev.off()

