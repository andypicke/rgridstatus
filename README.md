
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
#> 3 2020-01-01T08:00:00+00:00 2024-05-05T06:00:00+00:00      caiso
#> 4 2010-01-01T08:00:00+00:00 2024-05-05T06:00:00+00:00      caiso
#> 5 2021-06-18T07:00:00+00:00 2024-05-04T07:00:00+00:00      caiso
#> 6 2016-06-30T07:00:00+00:00 2024-05-03T01:00:00+00:00      caiso
#>           last_checked_time
#> 1 2024-05-04T16:35:59+00:00
#> 2 2024-05-04T16:36:00+00:00
#> 3 2024-05-04T16:40:55+00:00
#> 4 2024-05-04T16:40:04+00:00
#> 5 2024-05-04T15:30:48+00:00
#> 6 2024-05-04T16:40:16+00:00
#>                                                         index_columns
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

df <- fetch_dataset("caiso_fuel_mix")
#> No encoding supplied: defaulting to UTF-8.

str(df)
#> 'data.frame':    1440 obs. of  15 variables:
#>  $ interval_start_utc: POSIXct, format: "2024-04-29 00:00:00" "2024-04-29 00:05:00" ...
#>  $ solar             : int  12944 12946 12882 12831 12913 13076 13104 13044 12881 13007 ...
#>  $ wind              : int  3717 3718 3748 3785 3690 3692 3837 4047 4072 4118 ...
#>  $ geothermal        : int  782 781 781 781 780 782 781 781 781 782 ...
#>  $ biomass           : int  160 161 162 161 161 161 163 167 168 170 ...
#>  $ biogas            : int  174 174 174 174 174 174 174 174 174 174 ...
#>  $ small_hydro       : int  274 274 273 274 274 275 274 273 273 274 ...
#>  $ coal              : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ nuclear           : int  1143 1143 1144 1144 1144 1144 1144 1144 1144 1144 ...
#>  $ natural_gas       : int  1204 1217 1246 1295 1325 1339 1352 1362 1371 1380 ...
#>  $ large_hydro       : int  1344 1379 1483 1537 1536 1521 1532 1549 1585 1625 ...
#>  $ batteries         : int  -412 -747 -879 -894 -554 -234 23 49 426 422 ...
#>  $ imports           : int  -3746 -3344 -3025 -2879 -3008 -3249 -3431 -3449 -3512 -3492 ...
#>  $ other             : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ datetime_local    : POSIXct, format: "2024-04-28 17:00:00" "2024-04-28 17:05:00" ...
```
