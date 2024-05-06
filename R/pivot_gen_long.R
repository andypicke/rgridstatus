#' Pivot generation (fuel-mix) data to long format
#' @param df Dataframe of generation data in wide format (as returned by fetch_dataset())
#' @returns Dataframe pivoted to long format
#' @seealso [fetch_dataset()]
#' @export

pivot_gen_long <- function(df){

  df <- df |>
    tidyr::pivot_longer(cols = -c('interval_start_utc', 'datetime_local'),
                        names_to = "Fuel Type",
                        values_to = "MWh")

}
