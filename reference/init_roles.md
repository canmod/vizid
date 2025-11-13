# Initialize Variable Roles

Initialize a data structure containing the roles of variables in a data
frame for epidemiological visualization.

## Usage

``` r
init_roles(
  cases_variable = waiver(),
  population_variable = waiver(),
  birth_variable = waiver(),
  death_variable = waiver(),
  series_variable = waiver(),
  median_cases_variable = waiver(),
  count_variable = waiver(),
  total_count_variable = waiver(),
  norm_variable = waiver(),
  time_variable = waiver(),
  period_end_variable = waiver(),
  period_mid_time_variable = waiver(),
  period_mid_date_variable = waiver(),
  period_mid_variable = waiver(),
  period_start_variable = waiver(),
  date_variable = waiver(),
  integer_time_variable = waiver(),
  numeric_time_variable = waiver(),
  time_scale_variable = waiver(),
  period_width_variable = waiver(),
  period_days_variable = waiver(),
  time_group_variable = waiver(),
  time_grouping_variable = waiver(),
  disease_variable = waiver(),
  hierarchical_variable = waiver(),
  nesting_variable = waiver(),
  basal_variable = waiver(),
  title_variable = waiver(),
  grouping_variable = waiver(),
  among_panel_variable = waiver(),
  within_panel_variable = waiver(),
  colour_variable = waiver(),
  category_variable = waiver(),
  categorical_variable = waiver(),
  ...
)
```

## Arguments

- cases_variable:

  Name of variable containing unstandardized reported incidence.

- population_variable:

  Name of variable containing population numbers.

- birth_variable:

  Name of variable containing numbers of births.

- death_variable:

  Name of variable containing numbers of deaths.

- series_variable:

  Name of variable that can be used on the y-axis of a time-series.

- median_cases_variable:

  Name of variable containing the median of a set of count variables.

- count_variable:

  Name of variable containing a count (e.g., cases, births, deaths,
  population).

- total_count_variable:

  Name of variable containing a marginal total of a set of counts.

- norm_variable:

  Name of variable that can be used to normalize another variable (e.g.,
  population normalized cases).

- time_variable:

  Name of variable that characterizes the temporal location of the time
  period.

- period_end_variable:

  Name of variable containing

- period_mid_time_variable:

  Name of variable containing

- period_mid_date_variable:

  Name of variable containing

- period_mid_variable:

  Name of variable containing

- period_start_variable:

  Name of variable containing

- date_variable:

  Name of variable containing

- integer_time_variable:

  Name of variable containing

- numeric_time_variable:

  Name of variable containing

- time_scale_variable:

  Name of variable containing

- period_width_variable:

  Name of variable that characterizes the width of the time period.

- period_days_variable:

  Name of variable containing

- time_group_variable:

  Name of variable containing

- time_grouping_variable:

  Name of variable containing

- disease_variable:

  Name of variable containing

- hierarchical_variable:

  Name of variable containing

- nesting_variable:

  Name of variable containing

- basal_variable:

  Name of variable containing

- title_variable:

  Name of variable containing

- grouping_variable:

  Name of variable containing

- among_panel_variable:

  Name of variable containing

- within_panel_variable:

  Name of variable containing

- colour_variable:

  Name of variable containing

- category_variable:

  Name of variable containing

- categorical_variable:

  Name of variable containing

- ...:

  Roles not yet thought of.

## Details

Each parameter corresponds to a specific role that a variable can play
in the dataset. The value for each parameter should be the name of the
variable (column) in the data frame.
