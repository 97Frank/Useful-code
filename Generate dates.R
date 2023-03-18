generate_dates <- function(start_date, end_date = today()) {
 
 
  if (ymd(start_date) >= ymd(end_date)) {
    stop("End date needs to be later then the start date")
  }
  
  else{
    dates <- seq(from = ymd(start_date), to = ymd(end_date), by = "day")
    return(dates)
  }
}


generate_dates("2021-01-01", "2021-05_07")

