
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rgridstatus

<!-- badges: start -->

[![R-CMD-check](https://github.com/andypicke/rgridstatus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/andypicke/rgridstatus/actions/workflows/R-CMD-check.yaml)
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
info <- get_datasets()
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
#>     earliest_available_time     latest_available_time
#> 1 2019-06-11T03:25:00+00:00 2024-04-05T15:00:00+00:00
#> 2 2019-04-05T15:20:00+00:00 2024-04-01T06:05:00+00:00
#> 3 2020-01-01T08:00:00+00:00 2024-04-29T06:00:00+00:00
#> 4 2010-01-01T08:00:00+00:00 2024-04-28T18:00:00+00:00
#> 5 2021-06-18T07:00:00+00:00 2024-04-27T07:00:00+00:00
#> 6 2016-06-30T07:00:00+00:00 2024-04-27T01:00:00+00:00
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              dataset_metadata.available_cols
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   rank, iso, interval_start_utc, date, record_type, metric_name, metric_value, BIGINT, TEXT, TIMESTAMP, DATE, TEXT, TEXT, DOUBLE PRECISION
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 iso, interval_start_utc, date, record_type, metric_name, metric_value, TEXT, TIMESTAMP, DATE, TEXT, TEXT, DOUBLE PRECISION
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         interval_start_utc, interval_end_utc, region, market, non_spinning_reserves, regulation_down, regulation_mileage_down, regulation_mileage_up, regulation_up, spinning_reserves, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION
#> 4 interval_start_utc, interval_end_utc, region, market, non_spinning_reserves_procured_mw, non_spinning_reserves_self_provided_mw, non_spinning_reserves_total_mw, non_spinning_reserves_total_cost, regulation_down_procured_mw, regulation_down_self_provided_mw, regulation_down_total_mw, regulation_down_total_cost, regulation_mileage_down_procured_mw, regulation_mileage_down_self_provided_mw, regulation_mileage_down_total_mw, regulation_mileage_down_total_cost, regulation_mileage_up_procured_mw, regulation_mileage_up_self_provided_mw, regulation_mileage_up_total_mw, regulation_mileage_up_total_cost, regulation_up_procured_mw, regulation_up_self_provided_mw, regulation_up_total_mw, regulation_up_total_cost, spinning_reserves_procured_mw, spinning_reserves_self_provided_mw, spinning_reserves_total_mw, spinning_reserves_total_cost, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     publish_time_utc, outage_mrid, resource_name, resource_id, outage_type, nature_of_work, curtailment_start_time, curtailment_end_time, curtailment_mw, resource_pmax_mw, net_qualifying_capacity_mw, TIMESTAMP, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TIMESTAMP, TIMESTAMP, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  interval_start_utc, interval_end_utc, curtailment_type, curtailment_reason, fuel_type, curtailment_mwh, curtailment_mw, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, VARCHAR, INTEGER, INTEGER
#>   dataset_metadata.num_rows     source         last_checked_time
#> 1                       530 gridstatus 2024-04-27T18:50:59+00:00
#> 2                      1190 gridstatus 2024-04-27T18:50:59+00:00
#> 3                    217728      caiso 2024-04-27T18:48:46+00:00
#> 4                    593101      caiso 2024-04-27T18:51:37+00:00
#> 5                   1896127      caiso 2024-04-27T15:29:40+00:00
#> 6                     61672      caiso 2024-04-27T17:02:03+00:00
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
```

### Get list of dataset updates

``` r

updates <- get_dataset_updates()
#> No encoding supplied: defaulting to UTF-8.
head(updates)
#>        id                           dataset                  time_utc
#> 1 7838207                        nyiso_load 2024-04-27T18:53:05+00:00
#> 2 7838206        ercot_real_time_as_monitor 2024-04-27T18:53:05+00:00
#> 3 7838205                    nyiso_load_raw 2024-04-27T18:53:05+00:00
#> 4 7838203 ercot_real_time_system_conditions 2024-04-27T18:53:02+00:00
#> 5 7838204         nyiso_lmp_real_time_5_min 2024-04-27T18:53:01+00:00
#> 6 7838202 ercot_real_time_system_conditions 2024-04-27T18:52:55+00:00
#>   num_rows_updated
#> 1                1
#> 2                1
#> 3                2
#> 4                1
#> 5               30
#> 6                1
```

### Download a dataset

``` r

df <- fetch_dataset("caiso_fuel_mix")
#> No encoding supplied: defaulting to UTF-8.

head(df)
#>    interval_start_utc solar wind geothermal biomass biogas small_hydro coal
#> 1 2024-04-22 00:00:00 15153  725        782     118    172         260    0
#> 2 2024-04-22 00:05:00 15051  769        783     119    172         263    0
#> 3 2024-04-22 00:10:00 14680  784        784     119    172         269    0
#> 4 2024-04-22 00:15:00 14385  778        784     120    172         275    0
#> 5 2024-04-22 00:20:00 14121  791        784     120    172         281    0
#> 6 2024-04-22 00:25:00 13837  796        783     120    172         281    0
#>   nuclear natural_gas large_hydro batteries imports other      datetime_local
#> 1    1142        2423        1414       701   -2860     0 2024-04-21 17:00:00
#> 2    1142        2489        1815         4   -2384     0 2024-04-21 17:05:00
#> 3    1141        2503        1899      -224   -1725     0 2024-04-21 17:10:00
#> 4    1142        2509        1906       -52   -1385     0 2024-04-21 17:15:00
#> 5    1142        2586        2183       148   -1468     0 2024-04-21 17:20:00
#> 6    1142        2680        2187       571   -1481     0 2024-04-21 17:25:00
```
