
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rgridstatus

<!-- badges: start -->

[![R-CMD-check](https://github.com/andypicke/rgridstatus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/andypicke/rgridstatus/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Project Status:
WIP](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

The goal of rgridstatus is to provide a R API wrapper for the
[GridStatusIO](https://www.gridstatus.io/home)
[API](https://www.gridstatus.io/api).

See also my [blog
post](https://andypicke.quarto.pub/portfolio/posts/rGridStatus/rGridStatus.html)
describing some features of the package.

## Installation

You can install the development version of
[rgridstatus](https://github.com/andypicke/rgridstatus) from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("andypicke/rgridstatus")
```

You will need to register for an API key. By default, all functions
assume you have stored your API key in your *.Renviron* file with the
name *GRIDSTATUS_API_KEY*.

## Examples

### Get info on datasets available from GridStatus API:

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
#> 3                                  CAISO AS Prices
#> 4                         CAISO AS Procurement DAM
#> 5 CAISO Curtailed Non Operational Generator Report
#> 6                                CAISO Curtailment
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       description
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Top daily records for various metrics across all ISOs
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Timeline of new records for various metrics in all ISOs
#> 3 Ancillary Services Prices as reported by CAISO.\n\n**AS Mapping**\n\nThe *_EXP show only the intertie resources.\n \n-    AS_SP26_P: Resources in AS_SP26\n-    AS_NP26_P: Resources in AS_NP26\n-    AS_SP15_P: Resources in AS_SP15\n-    AS_NP15_P: Resources in AS_NP15\n-    AS_SP26_EXP_P: Resources in AS_SP26_EXP which are not in AS_SP26\n-    AS_NP26_EXP_P: Resources in AS_NP26_EXP which are not in AS_NP26\n-    AS_SP15_EXP_P: Resources in AS_SP15_EXP which are not in AS_SP15\n-    AS_NP15_EXP_P: Resources in AS_NP15_EXP which are not in AS_NP15\n-    AS_CAISO_NP26_P: Resources in AS_CAISO which are not in AS_SP26\n-    AS_CAISO_SP26_P: Resources in AS_CAISO which are not in AS_NP26\n-    AS_CAISO_NP15_P: Resources in AS_CAISO which are not in AS_SP15\n-    AS_CAISO_SP15_P: Resources in AS_CAISO which are not in AS_NP15
#> 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Ancillary services procurement data from CAISO.\nIncludes total MW procured and costs.  Corresponds\nto CAISO AS_RESULTS dataset on OASIS. See caiso_as_prices dataset\nfor per MW prices that result from market run.
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        Prior Day Curtailed Non-Operational Generator Report as reported by CAISO.\n\nSource: https://www.caiso.com/market-operations/outages/curtailed-and-non-operational-generators\nGlossary: https://www.caiso.com/glossary
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Daily Curtailment data as reported by CAISO.\n\nSource: https://www.caiso.com/about/our-business/managing-the-evolving-grid\n\nNote: CAISO did not publish curtailment reports for 2024-07-26 and 2024-07-27.
#>     earliest_available_time     latest_available_time     source
#> 1 2017-12-13T22:05:00+00:00 2024-09-07T19:10:00+00:00 gridstatus
#> 2 2011-01-01T06:30:00+00:00 2024-09-07T19:10:00+00:00 gridstatus
#> 3 2010-01-01T08:00:00+00:00 2024-09-14T06:00:00+00:00      caiso
#> 4 2010-01-01T08:00:00+00:00 2024-09-14T06:00:00+00:00      caiso
#> 5 2021-06-18T07:00:00+00:00 2024-09-13T07:00:00+00:00      caiso
#> 6 2017-01-01T12:00:00+00:00 2024-09-12T02:00:00+00:00      caiso
#>           last_checked_time
#> 1 2024-09-13T15:46:30+00:00
#> 2 2024-09-13T15:46:30+00:00
#> 3 2024-09-13T15:46:59+00:00
#> 4 2024-09-13T15:47:04+00:00
#> 5 2024-09-13T15:36:16+00:00
#> 6 2024-09-13T15:47:08+00:00
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
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                all_columns
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   rank, iso, interval_start_utc, date, record_type, metric_name, metric_value, BIGINT, TEXT, TIMESTAMP, DATE, TEXT, TEXT, DOUBLE PRECISION, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              iso, interval_start_utc, date, record_type, metric_name, metric_value, TEXT, TIMESTAMP, DATE, TEXT, TEXT, DOUBLE PRECISION, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE
#> 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   interval_start_utc, interval_end_utc, region, market, non_spinning_reserves, regulation_down, regulation_mileage_down, regulation_mileage_up, regulation_up, spinning_reserves, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
#> 4 interval_start_utc, interval_end_utc, region, market, non_spinning_reserves_procured_mw, non_spinning_reserves_self_provided_mw, non_spinning_reserves_total_mw, non_spinning_reserves_total_cost, regulation_down_procured_mw, regulation_down_self_provided_mw, regulation_down_total_mw, regulation_down_total_cost, regulation_mileage_down_procured_mw, regulation_mileage_down_self_provided_mw, regulation_mileage_down_total_mw, regulation_mileage_down_total_cost, regulation_mileage_up_procured_mw, regulation_mileage_up_self_provided_mw, regulation_mileage_up_total_mw, regulation_mileage_up_total_cost, regulation_up_procured_mw, regulation_up_self_provided_mw, regulation_up_total_mw, regulation_up_total_cost, spinning_reserves_procured_mw, spinning_reserves_self_provided_mw, spinning_reserves_total_mw, spinning_reserves_total_cost, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                publish_time_utc, outage_mrid, resource_name, resource_id, outage_type, nature_of_work, curtailment_start_time, curtailment_end_time, curtailment_mw, resource_pmax_mw, net_qualifying_capacity_mw, TIMESTAMP, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TIMESTAMP, TIMESTAMP, DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  interval_start_utc, interval_end_utc, curtailment_type, curtailment_reason, fuel_type, curtailment_mwh, curtailment_mw, TIMESTAMP, TIMESTAMP, VARCHAR, VARCHAR, VARCHAR, INTEGER, INTEGER, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE
#>   number_of_rows_approximate        table_type is_in_snowflake data_frequency
#> 1                        560 materialized_view           FALSE      IRREGULAR
#> 2                       1871 materialized_view           FALSE      IRREGULAR
#> 3                     621445             table            TRUE         1_HOUR
#> 4                     623449             table            TRUE         1_HOUR
#> 5                    2200875             table            TRUE      IRREGULAR
#> 6                      67748             table            TRUE      5_MINUTES
#>   is_published                created_at                updated_at
#> 1         TRUE                      <NA>                      <NA>
#> 2         TRUE                      <NA>                      <NA>
#> 3         TRUE 2023-04-20T07:00:37+00:00 2024-08-21T18:50:24+00:00
#> 4         TRUE 2023-11-20T15:34:56+00:00 2024-08-21T18:50:57+00:00
#> 5         TRUE 2023-10-04T00:04:17+00:00 2024-07-23T11:08:40+00:00
#> 6         TRUE 2023-04-20T16:35:38+00:00 2024-08-05T17:05:58+00:00
#>                                                                                 source_url
#> 1                                                                                     <NA>
#> 2                                                                                     <NA>
#> 3                                                 http://oasis.caiso.com/mrioasis/logon.do
#> 4                                                 http://oasis.caiso.com/mrioasis/logon.do
#> 5 https://www.caiso.com/market-operations/outages/curtailed-and-non-operational-generators
#> 6                      https://www.caiso.com/about/our-business/managing-the-evolving-grid
#>   publication_frequency
#> 1                    NA
#> 2                    NA
#> 3                    NA
#> 4                    NA
#> 5                    NA
#> 6                    NA
```

### Get unique data source names

``` r

# input is info from get_available_datasets()
sources <- get_source_names(info)
sources
#>  [1] "all"     "caiso"   "dataset" "eia"     "ercot"   "ieso"    "isone"  
#>  [8] "isos"    "miso"    "nyiso"   "pjm"     "spp"
```

### Get dataset names for one operator/source

``` r

info_caiso <- get_available_datasets() |> dplyr::filter(stringr::str_detect(name,"CAISO"))
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
#>  $ interval_start_utc: POSIXct, format: "2024-09-08 00:00:00" "2024-09-08 00:05:00" ...
#>  $ solar             : int  9125 9160 8984 8863 8657 8357 7975 7506 7024 6622 ...
#>  $ wind              : int  2375 2362 2362 2376 2388 2435 2453 2466 2462 2485 ...
#>  $ geothermal        : int  797 796 796 796 797 797 797 797 797 797 ...
#>  $ biomass           : int  337 335 336 335 337 333 335 334 334 333 ...
#>  $ biogas            : int  167 168 168 168 168 167 168 168 167 168 ...
#>  $ small_hydro       : int  258 255 253 254 254 254 255 255 255 255 ...
#>  $ coal              : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ nuclear           : int  2244 2243 2245 2244 2244 2243 2244 2244 2245 2243 ...
#>  $ natural_gas       : int  18022 17911 17326 17392 17543 17628 17874 18346 18827 19177 ...
#>  $ large_hydro       : int  3635 3891 3966 4020 4076 4171 4234 4231 4236 4235 ...
#>  $ batteries         : int  3227 2967 3055 3088 3148 3250 3487 3663 3790 3992 ...
#>  $ imports           : int  1478 1589 1904 2036 2026 2044 1858 1845 1873 1790 ...
#>  $ other             : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ datetime_local    : POSIXct, format: "2024-09-07 17:00:00" "2024-09-07 17:05:00" ...
```

### Pivot fuel mix dataframe to long format for easier plotting

``` r

df_long <- pivot_gen_long(df)

head(df_long)
#> # A tibble: 6 × 4
#>   interval_start_utc  datetime_local      fuel_type   generation
#>   <dttm>              <dttm>              <chr>            <int>
#> 1 2024-09-08 00:00:00 2024-09-07 17:00:00 solar             9125
#> 2 2024-09-08 00:00:00 2024-09-07 17:00:00 wind              2375
#> 3 2024-09-08 00:00:00 2024-09-07 17:00:00 geothermal         797
#> 4 2024-09-08 00:00:00 2024-09-07 17:00:00 biomass            337
#> 5 2024-09-08 00:00:00 2024-09-07 17:00:00 biogas             167
#> 6 2024-09-08 00:00:00 2024-09-07 17:00:00 small_hydro        258
```
