#' Generate and upload dummy data
#'
#' Populates the UNP dummy device with data when run
#'
#' @param db database connector
#' @export

generate <- function(db) {
  t <- Sys.time()
  th <- tempHumidity(t)
  af <- audioFile(t)
  #Upload abiotic
  #Upload audio

}
