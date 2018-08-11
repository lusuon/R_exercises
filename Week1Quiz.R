#How many missing values are in the Ozone column of this data frame?
badOzone<-hw1_data[!complete.cases(hw1_data$Ozone),]$Ozone
length(badOzone)

#What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
goodOzoneData<-hw1_data[complete.cases(hw1_data$Ozone),]
mean(goodOzoneData$Ozone)

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
OzoneRule<-hw1_data$Ozone>31
TempRule<-hw1_data$Temp>90
MainRule<-OzoneRule & TempRule
FiltedData<-hw1_data[MainRule,]
goodFiltedSolar<- complete.cases(FiltedData$Solar.R)
mean(FiltedData[goodFiltedSolar,]$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
june<- hw1_data$Month == 6
juneData<-hw1_data[june,]
goodJuneTemp <- complete.cases(juneData$Temp)
mean(juneData[goodJuneTemp,]$Temp)

#What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
may<- hw1_data$Month == 5
mayData<-hw1_data[may,]
goodMayOzone <- complete.cases(mayData$Ozone)
max(mayData[goodMayOzone,]$Ozone)