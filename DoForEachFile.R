DoForEachFile <-
function(filenames,path = "data/raw",z=1,xdf=data.frame(matrix(nrow=10,ncol=3))) {
  for (f in filenames) {
    ##read data into 'dat' dataframe from csv file    
    dat <- read.csv(file = file.path(path,f), header = TRUE)
    ##create second dataframe without first column (subject numbers or 'infants')
    dat2 <- dat[,2:length(dat[1,])]
    days <- names(dat2)

    aa = 1  #idmarker.  increments along with id number (or infants)

    infants <- dat[,1]  ##create a vector of subject numbers from first column of input file

    for (j in infants) {
       weights <- GetWeights(aa,dat2)

       output <- SetData(weights,days)
       if (!is.na(output[1,1])) {

          xdf[z:(z+length(output[,1])-1),1] <- j
          xdf[z:(z+length(output[,1])-1),2:3] <- output[,1:2]
          z = z + length(output[,1])
       }
       aa = aa + 1
          }
    aa = 1
    }
return(xdf)
}
