
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rgridstatus

<!-- badges: start -->

[![R-CMD-check](https://github.com/andypicke/rgridstatus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/andypicke/rgridstatus/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of rgridstatus is to provide a R API wrapper for the
[GridStatusIO](https://www.gridstatus.io/home)
[API](https://www.gridstatus.io/api).

## Installation

You can install the development version of rgridstatus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("andypicke/rgridstatus")
```

You will need to register for an API key. By default, all functions
assume you have stored your API key in your *.Renviron* file with the
name *GRIDSTATUS_API_KEY*.

## Examples

### Get info on available datasets:

``` r
library(rgridstatus)
info <- get_available_datasets()
#> No encoding supplied: defaulting to UTF-8.
head(info)
#>                                                 id
#> 1                                      all_records
#> 2                           all_records_timeseries
#> 3                                  caiso_as_prices
#> 4                         caiso_as_procurement_dam
#> 5 caiso_curtailed_non_operational_generator_report
#> 6                                caiso_curtailment
#>                                               name
#> 1                                      All Records
#> 2                           All Records Timeseries
#> 3                                  CAISO As Prices
#> 4                         CAISO As Procurement Dam
#> 5 CAISO Curtailed Non Operational Generator Report
#> 6                                CAISO Curtailment
#>                                                                                                                                                                                                                                                                                          description
#> 1                                                                                                                                                                                                                                              Top daily records for various metrics across all ISOs
#> 2                                                                                                                                                                                                                                            Timeline of new records for various metrics in all ISOs
#> 3                                                                                                                                                                                                                                                    Ancillary Services Prices as reported by CAISO.
#> 4                                                                             Ancillary services procurement data from CAISO.\nIncludes total MW procured and costs.  Corresponds\nto CAISO AS_RESULTS dataset on OASIS. See caiso_as_prices dataset\nfor per MW prices that result from market run.
#> 5 Prior Day Curtailed Non-Operational Generator Report as reported by CAISO.\n\nSource: http://www.caiso.com/market/Pages/OutageManagement/CurtailedandNonOperationalGenerators.aspx\nGlossary: http://www.caiso.com/market/Pages/OutageManagement/Curtailed-OperationalGeneratorReportGlossary.aspx
#> 6                                                                                                                                                                                Daily Curtailment data as reported by CAISO.\n\nSource: http://www.caiso.com/informed/Pages/ManagingOversupply.aspx
#>     earliest_available_time     latest_available_time     source
#> 1 2019-06-11T03:25:00+00:00 2024-04-05T15:00:00+00:00 gridstatus
#> 2 2019-04-05T15:20:00+00:00 2024-04-01T06:05:00+00:00 gridstatus
#> 3 2020-01-01T08:00:00+00:00 2024-05-07T06:00:00+00:00      caiso
#> 4 2010-01-01T08:00:00+00:00 2024-05-07T06:00:00+00:00      caiso
#> 5 2021-06-18T07:00:00+00:00 2024-05-05T07:00:00+00:00      caiso
#> 6 2016-06-30T07:00:00+00:00 2024-05-05T01:00:00+00:00      caiso
#>           last_checked_time
#> 1 2024-05-06T15:26:00+00:00
#> 2 2024-05-06T15:26:00+00:00
#> 3 2024-05-06T15:25:51+00:00
#> 4 2024-05-06T15:25:57+00:00
#> 5 2024-05-05T15:31:50+00:00
#> 6 2024-05-06T15:26:02+00:00
#>                                                   primary_key_columns
#> 1                                 iso, rank, record_type, metric_name
#> 2                   iso, interval_start_utc, record_type, metric_name
#> 3                                  interval_start_utc, region, market
#> 4                                          interval_start_utc, region
#> 5               publish_time_utc, outage_mrid, curtailment_start_time
#> 6 interval_start_utc, curtailment_type, curtailment_reason, fuel_type
#>   publish_time_column      time_index_column subseries_index_column
#> 1                <NA>     interval_start_utc                   <NA>
#> 2                <NA>     interval_start_utc                   <NA>
#> 3                <NA>     interval_start_utc                 region
#> 4                <NA>     interval_start_utc                 region
#> 5    publish_time_utc curtailment_start_time                   <NA>
#> 6                <NA>     interval_start_utc                   <NA>
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  all_columns
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   rank, iso, interval_start_utc, date, record_type, metric_name, metric_value, BIGINT, TEXT, TIMESTAMP, DATE, TEXT, TEXT, DOUBLE PRECISION
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 iso, interval_start_utc, date, record_type, metric_name, metric_value, TEXT, TIMESTAMP, DATE, TEXT, TEXT, DOUBLE PRECISION
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         interval_start_utc, interval_end_utc, region, market, non_spinning_reserves, regulation_down, regulation_mileage_down, regulation_mileage_up, regulation_up, spinning_reserves, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION
#> 4 interval_start_utc, interval_end_utc, region, market, non_spinning_reserves_procured_mw, non_spinning_reserves_self_provided_mw, non_spinning_reserves_total_mw, non_spinning_reserves_total_cost, regulation_down_procured_mw, regulation_down_self_provided_mw, regulation_down_total_mw, regulation_down_total_cost, regulation_mileage_down_procured_mw, regulation_mileage_down_self_provided_mw, regulation_mileage_down_total_mw, regulation_mileage_down_total_cost, regulation_mileage_up_procured_mw, regulation_mileage_up_self_provided_mw, regulation_mileage_up_total_mw, regulation_mileage_up_total_cost, regulation_up_procured_mw, regulation_up_self_provided_mw, regulation_up_total_mw, regulation_up_total_cost, spinning_reserves_procured_mw, spinning_reserves_self_provided_mw, spinning_reserves_total_mw, spinning_reserves_total_cost, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     publish_time_utc, outage_mrid, resource_name, resource_id, outage_type, nature_of_work, curtailment_start_time, curtailment_end_time, curtailment_mw, resource_pmax_mw, net_qualifying_capacity_mw, TIMESTAMP, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TIMESTAMP, TIMESTAMP, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  interval_start_utc, interval_end_utc, curtailment_type, curtailment_reason, fuel_type, curtailment_mwh, curtailment_mw, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, VARCHAR, INTEGER, INTEGER
#>   number_of_rows_approximate
#> 1                        530
#> 2                       1190
#> 3                     217728
#> 4                     593101
#> 5                    1896127
#> 6                      64863
```

### Get list of dataset updates

``` r

updates <- get_dataset_updates()
#> No encoding supplied: defaulting to UTF-8.
head(updates)
#>   id                  dataset                  time_utc num_rows_updated
#> 1  1  pjm_lmp_real_time_5_min 2023-04-19T22:10:19+00:00               34
#> 2  2 miso_lmp_real_time_5_min 2023-04-19T22:10:41+00:00              345
#> 3  3                miso_load 2023-04-19T22:11:46+00:00                1
#> 4  4            miso_fuel_mix 2023-04-19T22:11:54+00:00                1
#> 5  5           caiso_fuel_mix 2023-04-19T22:11:55+00:00                4
#> 6  6               caiso_load 2023-04-19T22:11:56+00:00                1
```

### Download a dataset

``` r

df <- get_gridstatus_dataset("caiso_fuel_mix")
#> No encoding supplied: defaulting to UTF-8.

str(df)
#> 'data.frame':    1440 obs. of  15 variables:
#>  $ interval_start_utc: POSIXct, format: "2024-05-01 00:00:00" "2024-05-01 00:05:00" ...
#>  $ solar             : int  15416 15147 14692 14552 14511 14339 14294 14188 13918 13785 ...
#>  $ wind              : int  4431 4469 4508 4515 4557 4569 4613 4612 4613 4640 ...
#>  $ geothermal        : int  790 790 790 790 790 790 790 789 790 789 ...
#>  $ biomass           : int  208 207 207 209 208 209 209 211 209 209 ...
#>  $ biogas            : int  169 169 168 169 169 168 168 168 169 169 ...
#>  $ small_hydro       : int  285 287 289 290 290 289 290 290 290 290 ...
#>  $ coal              : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ nuclear           : int  1146 1145 1145 1145 1145 1145 1145 1145 1145 1145 ...
#>  $ natural_gas       : int  3177 3304 3284 3383 3572 3655 3731 3718 3723 3729 ...
#>  $ large_hydro       : int  1610 1764 1845 1861 1923 1974 1993 2404 2555 2591 ...
#>  $ batteries         : int  -1291 -1508 -1417 -1026 -844 -732 -570 -494 -6 318 ...
#>  $ imports           : int  -3938 -3880 -3439 -3697 -3900 -3795 -3764 -3886 -4170 -4229 ...
#>  $ other             : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ datetime_local    : POSIXct, format: "2024-04-30 17:00:00" "2024-04-30 17:05:00" ...
```
