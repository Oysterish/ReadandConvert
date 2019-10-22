SetData <-
function(weight_vector,days_vector,y=1,z=1) {
  # function takes 'weight vector' and returns dataframe with non-missing values in columns along with day of measurement
  # y = nonmissing data counter.  increments with each non-missing data entry.  keeps track of correct entry line for output file
  # z = day counter.  Incrments with each loop.  keeps track of the day measurement was taken
  miniDataFrame <- data.frame(matrix(nrow = 1, ncol = 2))
  
  for (k in weight_vector) {

    if (!is.na(k)) {
      miniDataFrame[y,1] <- as.numeric(substring(days_vector[z],2,nchar(days_vector[z])))
      miniDataFrame[y,2] <- k
      y = y+1
      }
    z = z+1
  }
  return(miniDataFrame)
}
