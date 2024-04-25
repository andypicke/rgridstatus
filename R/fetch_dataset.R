#' Download dataset from API
#' @param wh_dataset Name of dataset to download
#' @param start_time Start time
#' @param end_time End time
#' @param api_key API key
#' @returns df: Dataframe fo requested dataset
#' @export

fetch_dataset <- function(wh_dataset = "caiso_fuel_mix",
                       start_time = "2024-04-06",
                       end_time = "2024-04-11",
                       api_key = Sys.getenv("GRIDSTATUS_API_KEY")) {


  # base url for the Gridstatusio API
  base_url <- "https://api.gridstatus.io/v1/"

  # construct full request url
  req_url <- paste0(base_url,"datasets/",wh_dataset,"/query?",
                    "download=true",
                    "&start_time=",start_time,
                    "&end_time=",end_time)

  resp <- httr::GET(req_url, httr::add_headers('x-api-key' = api_key))

  resp_parsed <- jsonlite::fromJSON(httr::content(resp, as = 'text'))

  df <- resp_parsed$data

  return(df)

}

