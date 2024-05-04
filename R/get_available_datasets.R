#' Get info on all available Gridstatus datasets
#'
#' @param api_key API key; defaults to key saved in renviron file
#' @returns Dataframe of available datasets and info
#' @export
#' @examples
#' info <- get_available_datasets()
#'


get_available_datasets <- function(api_key = Sys.getenv("GRIDSTATUS_API_KEY")){

  # base url for the Gridstatusio API
  base_url <- "https://api.gridstatus.io/v1/"

  req_url <- paste0(base_url,"datasets")

  resp <- httr::GET(req_url, httr::add_headers('x-api-key' = api_key))

  resp_parsed <- jsonlite::fromJSON(httr::content(resp, as = 'text'))

  df <- resp_parsed$data

  return(df)

}
