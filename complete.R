complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  filenames = dir(directory)
  nobs <- vector("numeric", length(id))
  index <- 1
  for (i in id)
  {
#    print(i)
    data_temp <- read.csv(paste(directory,filenames[i],sep="/"), header=T)
    good <- complete.cases(data_temp)
    good_cases <- data_temp[good,]
    nobs[index] <- nrow(good_cases)
    index <- index + 1
    
  }
#  print(id)
#  print(nobs)
  data.frame(cbind(id,nobs))
}
