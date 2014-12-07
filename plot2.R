## reading in dataset 
data <- read.csv("./power.txt",header=T, sep=';', na.strings="?",check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 


## get only Date >= "2007-02-01" & Date <= "2007-02-02" data 
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

rm(data) 


## Converting dates 
datetime <- paste(as.Date(subdata$Date), subdata$Time) 
subdata$Datetime <- as.POSIXct(datetime) 

## create plot 2 
plot(subdata$Global_active_power~subdata$Datetime, type="l", 
              ylab="Global Active Power", xlab="") 


## Saving to .png file 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
