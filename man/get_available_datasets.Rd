% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_available_datasets.R
\name{get_available_datasets}
\alias{get_available_datasets}
\title{Get info on all available Gridstatus datasets}
\usage{
get_available_datasets(api_key = Sys.getenv("GRIDSTATUS_API_KEY"))
}
\arguments{
\item{api_key}{API key; defaults to key saved in renviron file}
}
\value{
df: Dataframe of available datasets and info
}
\description{
Get info on all available Gridstatus datasets
}
