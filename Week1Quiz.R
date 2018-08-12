#How many missing values are in the Ozone column of this data frame?
badOzone<-hw1_data[!complete.cases(hw1_data$Ozone),]$Ozone
length(badOzone)
# 考虑对is.na()输出的布尔值向量使用sum（）获取NA值数量


# that has a TRUE for every NA and FALSE for every numeric value, we can compute the total number of NAs in our data.
# The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0.
# Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.
# sum(my_na)
# [1] 59

#What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
#取非NA子集示例：y <- x[!is.na(x)]

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