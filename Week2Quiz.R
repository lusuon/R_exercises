trans<-function(id){
  order<-1
  for (i in id) {
    while (nchar(i)<3){
      i<-paste0('0',i)
    }
    id[order]<-i
    order<- order+1
  }
  id
}

pollutantmean<-function(directory='./CSV/specdata',pollutant,id=1:332){#directory example:'./specdata';
  file_location<-paste(directory,'/',trans(id),'.csv',sep = '')#this var is a vector,cannot put in the function we create
  pollution_data<-data.frame()
  for (i in file_location){
    pollution_data<-rbind(pollution_data,read.csv(i))#How to combine the rows?
    
  }
  pollutant_choose<-pollution_data[[pollutant]]
  mean(pollutant_choose,na.rm = TRUE)
}

complete<- function(directory='./CSV/specdata',id= 1:332){
  complete_data<-data.frame()
  
  file_location<-paste(directory,'/',trans(id),'.csv',sep = '')
  
  #print(file_location)
  
  for (i in file_location){
    temp_data<-read.csv(i)
    current_id <-temp_data['ID'][1,]
    complete_condition<-is.na(temp_data$sulfate)==FALSE & is.na(temp_data$nitrate) ==FALSE
    nob<-nrow(subset(temp_data,complete_condition)) #Do not use the length(),it will return 4,the number of columns
    new_row<-c(current_id,nob)
    complete_data<-rbind(complete_data,new_row)
  }
  names(complete_data)<-c('id','nobs')
  complete_data
}

corr<-function(directory='./CSV/specdata',threshold= 0){
  filted_data<-subset(complete(),complete()$nobs>threshold)
  cors<-numeric()
  if(nrow(filted_data)!=0){#if the value of threshold too high will get a empty dataframe in this program
    for(i in 1:nrow(filted_data)){
      #get ID of the line,to go deeper,should read the origin csv to find data.
      line<-filted_data[i,]
      file_location<-paste(directory,'/',trans(line$'id'),'.csv',sep = '')
      #print(file_location)
      temp_csv<-read.csv(file_location)
      
      
      #get the data whose row is no NA
      
      complete_condition<-is.na(temp_csv$sulfate)==FALSE & is.na(temp_csv$nitrate) ==FALSE
      temp_complete<-subset(temp_csv,complete_condition) 
      line_sulfate<-temp_complete['sulfate']
      line_nitrate<-temp_complete['nitrate']
      cor_element<-cor(line_nitrate,line_sulfate)# cor() work fine;The attribute order does not change the result
      print(class(cor_element[1,1]))
      cors<-append(cors,cor_element[1,1])#If you want to add something into a vector ,remember to use'<-'
      #How about use the attribute na.rm?
    }
  }
  cors
}
  

