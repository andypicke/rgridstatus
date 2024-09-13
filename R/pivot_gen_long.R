#' Pivot generation (fuel-mix) data to long format
#' @param df Dataframe of generation data in wide format (as returned by get_gridstatus_dataset())
#' @returns Dataframe pivoted to long format with columns "fuel_type" and "generation"
#' @seealso [get_gridstatus_dataset()]
#' @export

pivot_gen_long <- function(df){

  df <- df |>
    tidyr::pivot_longer(cols = -c('interval_start_utc', 'datetime_local'),
                        names_to = "fuel_type",
                        values_to = "generation")

}
