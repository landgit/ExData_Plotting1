
setClass("myDate")
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
workData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("myDate", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

xset01 <- workData[(workData[ , 1] == "2007-02-01"), ] 
xset02 <- workData[(workData[ , 1] == "2007-02-02"), ]
xset <-rbind(xset01,xset02)

png(filename = "plot1.png", width = 480, height = 480)
hist(xset[ , 3], col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
