
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
#> 3 2020-01-01T08:00:00+00:00 2024-05-14T06:00:00+00:00      caiso
#> 4 2010-01-01T08:00:00+00:00 2024-05-14T06:00:00+00:00      caiso
#> 5 2021-06-18T07:00:00+00:00 2024-05-13T07:00:00+00:00      caiso
#> 6 2016-06-30T07:00:00+00:00 2024-05-12T02:00:00+00:00      caiso
#>           last_checked_time
#> 1 2024-05-13T15:31:12+00:00
#> 2 2024-05-13T15:31:12+00:00
#> 3 2024-05-13T15:29:45+00:00
#> 4 2024-05-13T15:29:51+00:00
#> 5 2024-05-13T15:30:07+00:00
#> 6 2024-05-13T15:29:56+00:00
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
#> 3                     228666
#> 4                     593101
#> 5                    1896127
#> 6                      64863
```

### Get list of dataset updates

``` r

updates <- get_dataset_updates()
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

str(df)
#> 'data.frame':    1440 obs. of  15 variables:
#>  $ interval_start_utc: POSIXct, format: "2024-05-08 00:00:00" "2024-05-08 00:05:00" ...
#>  $ solar             : int  13574 13484 13035 12734 12547 12709 12731 12716 12770 12845 ...
#>  $ wind              : int  4505 4457 4533 4523 4490 4588 4593 4653 4629 4580 ...
#>  $ geothermal        : int  761 761 762 761 761 761 761 761 762 762 ...
#>  $ biomass           : int  237 239 241 240 241 240 243 244 243 244 ...
#>  $ biogas            : int  155 154 155 153 154 154 153 153 153 153 ...
#>  $ small_hydro       : int  281 280 281 281 281 281 281 281 280 281 ...
#>  $ coal              : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ nuclear           : int  1143 1143 1143 1143 1143 1143 1143 1143 1144 1144 ...
#>  $ natural_gas       : int  2555 2525 2538 2543 2583 2698 2790 2846 2877 2887 ...
#>  $ large_hydro       : int  1730 2007 2109 2073 2105 2119 2100 2104 2152 2196 ...
#>  $ batteries         : int  19 -234 -487 -597 -237 -98 137 171 265 365 ...
#>  $ imports           : int  -4045 -3973 -3404 -2735 -2586 -2847 -2888 -2831 -2842 -2762 ...
#>  $ other             : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ datetime_local    : POSIXct, format: "2024-05-07 17:00:00" "2024-05-07 17:05:00" ...
```
