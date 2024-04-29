#' Download dataset from API
#' @param wh_dataset Name of dataset to download
#' @param start_time Start time. Default is 5 days ago.
#' @param end_time End time. Default is today's date.
#' @param api_key API key. Default is "GRIDSTATUS_API_KEY" stored in .Renviron file
#' @param tz_local Local timezone to display times in column "datetime_local" (default "US/Pacific"). See available timezones with OlsonNames()
#' @returns df: Dataframe fo requested dataset
#' @export

fetch_dataset <- function(wh_dataset = "caiso_fuel_mix",
                       start_time = Sys.Date() - 5,
                       end_time = Sys.Date(),
                       api_key = Sys.getenv("GRIDSTATUS_API_KEY"),
                       tz_local = "US/Pacific"
                       ) {


  # base url for the Gridstatusio API
  #base_url <- "https://api.gridstatus.io/v1/"

  # construct full request url
  req_url <- construct_query_url(wh_dataset, start_time, end_time)

  resp <- httr::GET(req_url, httr::add_headers('x-api-key' = api_key))

  resp_parsed <- jsonlite::fromJSON(httr::content(resp, as = 'text'))

  df <- resp_parsed$data

  # convert datetime column format
  df$interval_start_utc <- lubridate::as_datetime(df$interval_start_utc)
  # display in local timezone
  df$datetime_local <- lubridate::with_tz(df$interval_start_utc, tzone = tz_local )

  df <- df |> dplyr::select(-c('interval_end_utc'))

  return(df)

}

