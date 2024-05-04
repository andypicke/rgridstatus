#' Get info on all available Gridstatus datasets
#'
#' @param api_key API key; defaults to key saved in renviron file
#' @returns df: Dataframe of available datasets and info
#' @export
#' @examples
#' info <- get_available_datasets()
#'


get_available_datasets <- function(api_key = Sys.getenv("GRIDSTATUS_API_KEY")){

  # base url for the Gridstatusio API
  base_url <- "https://api.gridstatus.io/v1/"

  req_url <- paste0(base_url,"datasets")

  df <- get_api_request(query_url = req_url, api_key = api_key)

  return(df)

}
