best <- function(state, outcome_input) {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcome[, 7] <- as.factor(outcome[, 7])
  #Store the list of outcomes
  name_split<-lapply(names(outcome),strsplit,split = 'from.')
  outcome_names<-vector()
  for (i in name_split){
    for(j in i){
      if (length(j)==2){
        outcome_names<-append(outcome_names,j[2])
      }
    }
  }
  outcome_NAMES<-unique(outcome_names)
  outcome_names<-tolower(unique(outcome_names))
  outcome_names<-lapply(outcome_names,gsub,pattern = ".",replacement = ' ',fixed = TRUE)
  
  #print(outcome_names)
  
  ## Check that state and outcome are valid
  if(!state %in% levels(outcome[, 7])){
    return('The input of state is invalid.')
  }else if(!outcome_input %in% outcome_names){
    #print(outcome_input)
    return('The input of outcome invalid.') 
  }
  label<-outcome_NAMES[which(outcome_names == outcome_input)]
  death_rate_label<-paste('Hospital.30.Day.Death..Mortality..Rates.from',label,sep = '.')
  selected_state_data<-outcome[outcome$State == state,]
  selected_state_data[which.min(selected_state_data[[death_rate_label]]),]$Hospital.Name
}

rankhospital <- function(state, outcome, num = "best") { 
  ## Read outcome data
  
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with the given rank 30-day death rate
}
