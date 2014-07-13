## Plot 4 

# Reades file into data frame
fulldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

# Read Relevant Data

febdata<-fulldata[with(fulldata, Date=="1/2/2007"|Date=="2/2/2007"), ]

# Creates Plot 4
dateTime <- strptime( paste(febdata$Date,dados2$Time), format="%d/%m/%Y %H:%M:%S")
febdata<-cbind(febdata, dateTime)

#Sets the pallete for 4 charts
par(mfrow = c(2,2))
with (febdata, {
        
        #plot1
        plot( dateTime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
        #plot2      
        plot( dateTime, Voltage, type = "l",xlab = "", ylab = "")
        #plot3      --- This is not right I know but not sure what do I need to do..please help
        
        plot(dateTime, Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black" )
        legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
        lines(dateTime,Sub_metering_2,type = "l", col = "red")
        lines(dateTime,Sub_metering_3,type = "l", col = "blue")
        
        #plot4
        plot(dateTime,Global_active_power, type ='l', xlab ="datetime")
        ################################################
        
        
        
})


#Creates PNG
dev.copy(png, file="plot4.png")
dev.off()
