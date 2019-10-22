GetWeights <-
function(idmarker,data) {
  ##function gets measurements, one row at a time (by idmarker) and returns in 'weights', including NA's
  weights <- data[idmarker,]
  return(weights)
}
