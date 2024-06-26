#' Build URL for API data request
#' @param wh_dataset Name of dataset to download
#' @param start_time Start time. Default is 5 days ago.
#' @param end_time End time. Default is today's date.
#' @returns req_url URL for API request with specified parameters
#' @export
#' @seealso [get_available_datasets()]
#' @examples
#' req_url <- construct_query_url("caiso_fuel_mix", "2024-04-1", "2024-04-10")
#'
#'

construct_query_url <- function(wh_dataset = "caiso_fuel_mix",
                                start_time = Sys.Date() - 5,
                                end_time = Sys.Date()) {

  # base url for the Gridstatusio API
  base_url <- "https://api.gridstatus.io/v1/"

  # construct full request url
  req_url <- paste0(
    base_url, "datasets/", wh_dataset, "/query?",
    "download=true",
    "&start_time=", start_time,
    "&end_time=", end_time
  )
}
