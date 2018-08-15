pollutantmean<-function(directory,pollutant,id){
  trans<-function(id){
    order<-1
    for (i in id) {
      while (i!=3){
        i<-paste0('0',i)
        print(i)
      }
      i<-paste0("\'",i,"\'")
      id[order]<-i
      order<- order+1
    }
    id
  }
  
  trans(id)
}
  #file_location<-paste(directory,'/',trans(id),'.csv',sep = '')#如：‘./specdata’作为输入
  #print(file_location)
  #pollution_data<-read.csv(file_location)
  #pollution_data
  #pollutant_choose<-pollution_data[[pollutant]]
  #mean(pollutant_chooserse,na.rm = TRUE)

