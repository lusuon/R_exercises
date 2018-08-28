###I used the '<<-' to set the variables in the global environment so that we can use the function to simplify the code

loadata<-function(){
  ## Read outcome data
  outcome <<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcome[, 7] <<- as.factor(outcome[, 7])
  #Store the list of outcomes
  name_split<<-lapply(names(outcome),strsplit,split = 'from.')
  outcome_names<<-vector()
  for (i in name_split){
    for(j in i){
      if (length(j)==2){
        outcome_names<<-append(outcome_names,j[2])
      }
    }
  }
  outcome_NAMES<<-unique(outcome_names)
  outcome_names<<-tolower(unique(outcome_names))
  outcome_names<<-lapply(outcome_names,gsub,pattern = ".",replacement = ' ',fixed = TRUE)
}

check_input<-function(state, outcome_input){
  ## Check that state and outcome are valid
  if(is.null(state)){
    return('The input of state is invalid.')
  }else if(!state %in% levels(outcome[, 7])){
    next
  }else if(!outcome_input %in% outcome_names){
    #print(outcome_input)
    return('The input of outcome invalid.') 
  }
}

split_data<-function(state, outcome_input){
  #Generating the necessary label
  label<<-outcome_NAMES[which(outcome_names == outcome_input)]
  death_rate_label<<-paste('Hospital.30.Day.Death..Mortality..Rates.from',label,sep = '.')
  #split the data
  selected_state_data<<-outcome[outcome$State == state,]
}

get_rank<-function(data,num){
  condition <<- order(as.numeric(data[,death_rate_label]),data$Hospital.Name)
  ordered_data <<- data[condition,]
  if(num == "best"){
    return(ordered_data[1,]$Hospital.Name)
  }else if(num == "worst"){
    return(ordered_data[which.max(as.numeric(ordered_data[,death_rate_label])),]$Hospital.Name)
  }else{
    return(ordered_data[num,]$Hospital.Name)
  }
}

best <- function(state, outcome_input) {
  ## Read outcome data
  loadata()
  ## Check that state and outcome are valid
  check_input(state,outcome_input)
  ##prepare the other data
  split_data(state, outcome_input)
  ##output
  selected_state_data[which.min(selected_state_data[[death_rate_label]]),]$Hospital.Name
}

rankhospital <- function(state, outcome_input, num = "best") { 
  ## Read outcome data
  loadata()
  ## Check that state and outcome are valid
  check_input(state,outcome_input)
  ##prepare the data, which was devided by state
  split_data(state, outcome_input)
  
  ## Return hospital name in that state with the given rank 30-day death rate
  get_rank(selected_state_data,num)
}

rankall <- function(outcome_input, num_input = "best") { 
  ## Read outcome data
  loadata()
  ## Check that state and outcome are valid
  check_input(NULL, outcome_input)
  ## For each state, find the hospital of the given rank
  outcome_data_sep_by_state <<- split(outcome,outcome$State)
  
  #Generating the necessary label
  label<<-outcome_NAMES[which(outcome_names == outcome_input)]
  death_rate_label<<-paste('Hospital.30.Day.Death..Mortality..Rates.from',label,sep = '.')
  
  testing<<- sapply(outcome_data_sep_by_state,get_rank,num = num_input)
  ## Return a data frame with the hospital names and the (abbreviated) state name
  data.frame(hospital = testing,state = names(testing))
  
}
