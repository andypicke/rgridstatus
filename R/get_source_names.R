#' Get unique data source names
#'
#' @param info Output of get_available_datasets()
#'
#' @return Unique source names (ie ercot_fuel_mix >> ercot)
#' @export
get_source_names <- function(info){

  get_operator_name <- function(source_str){
    ind <- stringr::str_locate(source_str, "^*_")
    stringr::str_sub(source_str, 1, ind[1] - 1)
  }

  source_names <- purrr::map_chr(info$id, get_operator_name)

  sources <- unique(source_names)

}
