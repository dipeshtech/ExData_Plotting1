## Plot 2 

# Reades file into data frame
fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# Read Relevant Data

febdata<-fulldata[with(fulldata, Date=="1/2/2007"|Date=="2/2/2007"), ]

# Creates Plot 2
dateTime <- strptime( paste(febdata$Date,dados2$Time), format="%d/%m/%Y %H:%M:%S")
febdata<-cbind(febdata, dateTime)
with(febdata, plot(dateTime, Global_active_power, type="l"))


#Creates PNG
dev.copy(png, file="plot2.png")
dev.off()
