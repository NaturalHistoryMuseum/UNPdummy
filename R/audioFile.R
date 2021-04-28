#' Select an existing audio file to act as a dummy recording
#'
#' @param time time to generate temperature for (timestamp)
#' @importFrom sonicscrewdriver ab_seqss_nearestStart
#' @importFrom lubridate hour minute
audioFile <- function(time) {
  nearest <- ab_seqss_nearestStart(date="2020-05-15", time=paste0(hour(time),":",minute(time)))
  return(nearest[1,])
}
