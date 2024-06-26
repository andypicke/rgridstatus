% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dataset_updates.R
\name{get_dataset_updates}
\alias{get_dataset_updates}
\title{Get list of dataset updates that have occurred}
\usage{
get_dataset_updates(
  wh_dataset = "all",
  limit = 100,
  api_key = Sys.getenv("GRIDSTATUS_API_KEY")
)
}
\arguments{
\item{wh_dataset}{Name of dataset to download (default is all)}

\item{limit}{Max number of updates to fetch. default 100}

\item{api_key}{API key. Default is "GRIDSTATUS_API_KEY" stored in .Renviron file}
}
\value{
updates : Dataframe of dataset updates as reqeusted
}
\description{
Get list of dataset updates that have occurred
}
