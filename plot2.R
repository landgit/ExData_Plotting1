
setClass("myDate")
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
workData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("myDate", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

xset01 <- workData[(workData[ , 1] == "2007-02-01"), ] 
xset02 <- workData[(workData[ , 1] == "2007-02-02"), ]
xset <-rbind(xset01,xset02)


timeli <- strptime(paste(xset[,1], xset[,2]), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(timeli, (xset[, 3]), type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()