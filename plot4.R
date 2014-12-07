## reading in dataset 
data <- read.csv("./power.txt",header=T, sep=';', na.strings="?",check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 


## get only Date >= "2007-02-01" & Date <= "2007-02-02" data 
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

rm(data) 


## Converting dates 
datetime <- paste(as.Date(subdata$Date), subdata$Time) 
subdata$Datetime <- as.POSIXct(datetime) 

## create plot 4 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
 with(subdata, { 
       plot(Global_active_power~Datetime, type="l",  
                        ylab="Global Active Power", xlab="") 
       plot(Voltage~Datetime, type="l",  
                        ylab="Voltage", xlab="") 
       plot(Sub_metering_1~Datetime, type="l",  
                        ylab="Global Active Power", xlab="") 
       lines(Sub_metering_2~Datetime,col='Red') 
       lines(Sub_metering_3~Datetime,col='Blue') 
       legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
                            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
       plot(Global_reactive_power~Datetime, type="l",  
                        ylab="Global Rective Power",xlab="") 
   }) 


## Saving to .png file 
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 
