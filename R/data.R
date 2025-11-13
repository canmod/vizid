#' Data on Smallpox in Ontario
#'
#' Data smallpox in Ontario from the International Infectious Disease Data 
#' Archive (IIDDA).
#'
#' @format ## `smallpox_ontario`
#' A data frame with 2001 rows and 21 columns:
#' \describe{
#'   \item{period_start_date}{The first date within the time interval for which a count was reported, in ISO-8601 format (i.e. YYYY-MM-DD). Must be of the form <start date>..<end date>.}
#'   \item{period_end_date}{The last date within the time interval for which a count was reported, in ISO-8601 format (i.e. YYYY-MM-DD). Must be of the form <start date>..<end date>.}
#'   \item{days_this_period}{Number of days in the reporting interval, computed from \code{period_start_date} and \code{period_end_date}.}
#'   \item{population}{Estimated total number of individuals associated with a particular record.}
#'   \item{cases_this_period}{Number of cases reported for this period, at the end of this period, as reported by the original source. May include different types of missing values as reported by the original source.}
#' }
#' @source <https://github.com/canmod/iidda>
"smallpox_ontario"
