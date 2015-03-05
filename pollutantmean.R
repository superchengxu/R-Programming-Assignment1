pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  filenames <- dir(directory)
  data_to_cal <- data.frame()
  for (i in id)
  {
    data_temp <- read.csv(paste(directory,filenames[i],sep="/"), header=T)
    data_to_cal <- rbind(data_to_cal,data_temp)
  }
  
#  print(data_to_cal)
  if(pollutant == "sulfate")
  {
    round(mean(data_to_cal$sulfate,na.rm=T), 3)
  }
  else if(pollutant == "nitrate")
  {
    round(mean(data_to_cal$nitrate,na.rm=T), 3)
  }
  else return 
}
