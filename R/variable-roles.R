#' Initialize Variable Roles
#'
#' Initialize a data structure containing the roles of variables in a data frame
#' for epidemiological visualization.
#'
#' Each parameter corresponds to a specific role that a variable can play in the dataset.
#' The value for each parameter should be the name of the variable (column) in the data frame.
#'
#' @param cases_variable Name of variable containing unstandardized reported incidence.
#' @param population_variable Name of variable containing population numbers.
#' @param birth_variable Name of variable containing numbers of births.
#' @param death_variable Name of variable containing numbers of deaths.
#' @param series_variable Name of variable that can be used on the y-axis of a time-series.
#' @param median_cases_variable Name of variable containing the median of a set of count variables.
#' @param count_variable Name of variable containing a count (e.g., cases, births, deaths, population).
#' @param total_count_variable Name of variable containing a marginal total of a set of counts.
#' @param norm_variable Name of variable that can be used to normalize another variable (e.g., population normalized cases).
#' @param time_variable Name of variable that characterizes the temporal location of the time period.
#' @param period_end_variable Name of variable containing
#' @param period_mid_time_variable Name of variable containing
#' @param period_mid_date_variable Name of variable containing
#' @param period_mid_variable Name of variable containing
#' @param period_start_variable Name of variable containing
#' @param date_variable Name of variable containing
#' @param integer_time_variable Name of variable containing
#' @param numeric_time_variable Name of variable containing
#' @param time_scale_variable Name of variable containing
#' @param period_width_variable Name of variable that characterizes the width of the time period.
#' @param period_days_variable Name of variable containing
#' @param time_group_variable Name of variable containing
#' @param time_grouping_variable Name of variable containing
#' @param disease_variable Name of variable containing
#' @param hierarchical_variable Name of variable containing
#' @param nesting_variable Name of variable containing
#' @param basal_variable Name of variable containing
#' @param title_variable Name of variable containing
#' @param grouping_variable Name of variable containing
#' @param among_panel_variable Name of variable containing
#' @param within_panel_variable Name of variable containing
#' @param colour_variable Name of variable containing
#' @param category_variable Name of variable containing
#' @param categorical_variable Name of variable containing
#' @param ... Roles not yet thought of.
#'
#' @importFrom ggplot2 waiver is_waiver
#' @export
init_roles = function(
    cases_variable = waiver()
  , population_variable = waiver()
  , birth_variable = waiver()
  , death_variable = waiver()
  , series_variable = waiver()
  , median_cases_variable = waiver()
  , count_variable = waiver()
  , total_count_variable = waiver()
  , norm_variable = waiver()
  , time_variable = waiver()
  , period_end_variable = waiver()
  , period_mid_time_variable = waiver()
  , period_mid_date_variable = waiver()
  , period_mid_variable = waiver()
  , period_start_variable = waiver()
  , date_variable = waiver()
  , integer_time_variable = waiver()
  , numeric_time_variable = waiver()
  , time_scale_variable = waiver()
  , period_width_variable = waiver()
  , period_days_variable = waiver()
  , time_group_variable = waiver()
  , time_grouping_variable = waiver()
  , disease_variable = waiver()
  , hierarchical_variable = waiver()
  , nesting_variable = waiver()
  , basal_variable = waiver()
  , title_variable = waiver()
  , grouping_variable = waiver()
  , among_panel_variable = waiver()
  , within_panel_variable = waiver()
  , colour_variable = waiver()
  , category_variable = waiver()
  , categorical_variable = waiver()
  , ...

) {
  roles = as.list(environment())
  roles = structure(roles, class = "vizid_roles")
  (roles
    |> get_explicit_roles()
    |> check_init_roles("roles")
  )
  return(roles)
}

get_explicit_roles = function(roles) UseMethod("get_explicit_roles")

#' @export
get_explicit_roles.vizid_roles = function(roles) {
  (is_waiver
   |> Negate()
   |> Filter(roles)
   |> unclass()
   |> unlist(use.names = TRUE)
  )
}

#' @exportS3Method base::print
print.vizid_roles = function(x, ...) {
  explicit_roles = get_explicit_roles(x)
  if (length(explicit_roles) == 0L) {
    msg = print_msg("No explicit roles for variables")
  } else {
    title = print_msg("How variables would be used in a visualization:")
    map = sprintf("  would use `%s` as the `%s`"
      , unname(explicit_roles)
      , names(explicit_roles)
    )
    msg = c(title, map)
  }
  msg |> cat(sep = "\n")
  invisible(x)
}


# Standard role assignments
#
# The following functions return the names of variables that will
# commonly be used in particular roles. The name of these functions
# describes the role using the following format: `std_{ROLE}_variables()`
#
# These functions allow developers to configure how variable roles are
# guessed in cases where the user does not supply a variable name for
# a particular role. TODO -- explain how this happens


## reported incidence
std_cases_variables = function() {
  c(
      "cases_this_period"
    , "cases_prev_period"
    , "cases_this_period_mo"
    , "cases_this_period_qr"
    , "cases_this_period_sum"
    , "cases_this_period_wk"
    , "cases_this_period_yr"
    , "cases_prev_year"
    , "cases_two_years_ago"
    , "cases_cum_report_year"
    , "cases_cum_prev_year"
    , "cases_cum_median_prev_5_years"
    , "cases_median_prev_5_years"
  )
}

## demographics
std_population_variables = function() c("population", "population_reporting")
std_birth_variables = function() c("births", "christened")
std_death_variables = function() c("deaths", "burials")

## series variables -- contain numerical information that could
## represent a time series if processed appropriately
std_series_variables = function() {
  c(
      std_death_variables()
    , std_cases_variables()
    , std_birth_variables()
    , std_population_variables()

    ## from lbom
    , "infected_parishes"
    , "not_infected_parishes"
  )
}

# Utilities for working with standard role assignments

## List all defined roles
list_std_fn_nms = function() { # e.g., std_series_variables
  ("vizid"
    |> getNamespace()
    |> ls(pattern = "^std_[_a-z]+_variables$")
  )
}
list_roles = function() { # e.g., series
  x = list_std_fn_nms()
  x = sub("^std_", "", x)
  x = sub("_variables$", "", x)
  return(x)
}
list_role_args = function() { # e.g., series_variable
  x = list_std_fn_nms()
  x = sub("^std_", "", x)
  x = sub("_variables$", "_variable", x)
  return(x)
}
