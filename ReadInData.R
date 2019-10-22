ReadInData <-
function(path, pattern) {

  filenames <- list.files(path=path, pattern=pattern, full.names = FALSE)
  output<-DoForEachFile(filenames)
  return(output)
}
