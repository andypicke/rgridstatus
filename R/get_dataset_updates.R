#' Get list of dataset updates that have occurred
#' @param wh_dataset Name of dataset to download (default is all)
#' @param limit Max number of updates to fetch. default 100
#' @param api_key API key. Default is "GRIDSTATUS_API_KEY" stored in .Renviron file
#' @returns updates : Dataframe of dataset updates as reqeusted
#' @export

get_dataset_updates <- function(wh_dataset = "all", limit = 100, api_key = Sys.getenv("GRIDSTATUS_API_KEY")) {
  # base url for the Gridstatusio API
  base_url <- "https://api.gridstatus.io/v1/"

  if (wh_dataset != "all") {
    req_url <- paste0(base_url, "dataset-updates/", wh_dataset, "?limit=", limit)
  } else {
    req_url <- paste0(base_url, "dataset-updates?limit=", limit)
  }

  updates <- get_api_request(query_url = req_url, api_key = api_key)

}
