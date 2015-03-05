corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  filenames = dir(directory)
  co <- NA
  index <- 1
  for(i in 1:length(filenames))
  {
    data_temp <- read.csv(paste(directory,filenames[i],sep="/"),header = T)
    good <- complete.cases(data_temp)
    count <- length(good[good==TRUE])
    if (count >= threshold)
    {
      good_cases <- data_temp[good,]
      cor_rate <- cor(good_cases$sulfate, good_cases$nitrate)
      co[index] <- cor_rate
      index <- index + 1
    }
  }
  if(index>1)
  {
    round(co , 5)
  }
  else
  {
    co <- vector("numeric",0)
  }
}
