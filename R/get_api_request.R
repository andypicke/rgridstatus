#' Make API GET request and return data
#' @param query_url URL for the API query
#' @param api_key API key; Defaults is key saved in .renviron file as "GRIDSTATUS_API_KEY"
#' @returns data from the API response
#' @export

get_api_request <- function(query_url, api_key = Sys.getenv("GRIDSTATUS_API_KEY")){

  # send GET request
  resp <- httr::GET(query_url, httr::add_headers('x-api-key' = api_key), httr::user_agent("rgridstatus (https://github.com/andypicke/rgridstatus)"))

  # check if successful response code returned
  if (resp$status_code != 200) {
    stop(paste("API returned not 200 status code: ", resp$status_code))
  }

  #parse response
  resp_parsed <- jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))

  # return the data
  df <- resp_parsed$data
}
