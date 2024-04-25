
get_datasets <- function(api_key = Sys.getenv("GRIDSTATUS_API_KEY")){

  # base url for the Gridstatusio API
  base_url <- "https://api.gridstatus.io/v1/"

  req_url <- paste0(base_url,"datasets")

  resp <- httr::GET(req_url, httr::add_headers('x-api-key' = api_key))

  resp_parsed <- jsonlite::fromJSON(httr::content(resp, as = 'text'))
  #names(resp_parsed)

  df <- resp_parsed$data
  #glimpse(df)
  #View(df)

  return(df)

}
