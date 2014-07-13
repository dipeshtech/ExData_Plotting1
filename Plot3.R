## Plot 3 

# Reades file into data frame
fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# Read Relevant Data

febdata<-fulldata[with(fulldata, Date=="1/2/2007"|Date=="2/2/2007"), ]

# Creates Plot 3
dateTime <- strptime( paste(febdata$Date,dados2$Time), format="%d/%m/%Y %H:%M:%S")
febdata<-cbind(febdata, dateTime)

plot (x= febdata$dateTime, y= febdata$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")
## add additional lines
lines (x= febdata$dateTime, y= febdata$Sub_metering_2, col ="red")
lines (x= febdata$dateTime, y= febdata$Sub_metering_3, col ="blue")

## Add Legend ###

legend("topright" , # places a legend at the appropriate place 
       c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       
       lty=c(1,1,2), # gives the legend appropriate symbols (lines)
       bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue")) # gives the legend lines the correct 
# color and width

#Creates PNG
dev.copy(png, file="plot3.png")
dev.off()
