#' Generate dummy temperature and humidity
#'
#' Generates a very rough temperature based on current time
#'
#' @param time time to generate temperature for (timestamp)
#' @importFrom lubridate hour minute month day
#' @importFrom suncalc getSunlightTimes
tempHumidity <- function(time) {
  date <- lubridate::date(time)
  month <- month(time)
  day <- day(time)

  #Monthly averages for London
  mmin <- c(2.1, 2, 3.1, 5.1, 8.4, 11.4, 13.6, 13.3, 11.3, 8.6, 4.9, 2.8)
  mmax <- c(7.3, 7.8, 10.3, 13.6, 16.7, 19.6, 21.8, 21.1, 18.8, 14.9, 10.4, 7.7)
  hmax <- c(86,82,78,74,73,72,70,74,77,82,86,86)
  hmin <- hmax - 5
  #Days count
  dc <- c(31,29,31,30,31,30,31,31,30,31,30,31)

  #Daily min/max
  dmin <- mmin[month] + day/dc[month] * (mmin[month+1] - mmin[month])
  dmax <- mmax[month] + day/dc[month] * (mmax[month+1] - mmax[month])
  dhmin <- hmin[month] + day/dc[month] * (hmin[month+1] - hmin[month])
  dhmax <- hmax[month] + day/dc[month] * (hmax[month+1] - hmax[month])

  mc <- hour(time)*60 + minute(time) #minute count since midnight
  tt <- dmin +(sin(2*pi*mc/1440+3*pi/2) + 1)/2*(dmax-dmin)

  st <- getSunlightTimes(date=date, lat=54,lon=0, keep="dawn")$dawn
  md <- hour(st) * 60 + minute(st) #minutes between midnight and dawn
  th <- dhmin +(cos(2*pi*mc/1440 - md*2*pi/1440) + 1)/2*(dhmax-dhmin)

  ret <- list("temp"=round(tt,1), "RH"=round(th,1))
  return(ret)

}

