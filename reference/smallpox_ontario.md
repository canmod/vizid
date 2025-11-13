# Data on Smallpox in Ontario

Data smallpox in Ontario from the International Infectious Disease Data
Archive (IIDDA).

## Usage

``` r
smallpox_ontario
```

## Format

### `smallpox_ontario`

A data frame with 2001 rows and 21 columns:

- period_start_date:

  The first date within the time interval for which a count was
  reported, in ISO-8601 format (i.e. YYYY-MM-DD). Must be of the form
  ...

- period_end_date:

  The last date within the time interval for which a count was reported,
  in ISO-8601 format (i.e. YYYY-MM-DD). Must be of the form ...

- days_this_period:

  Number of days in the reporting interval, computed from
  `period_start_date` and `period_end_date`.

- population:

  Estimated total number of individuals associated with a particular
  record.

- cases_this_period:

  Number of cases reported for this period, at the end of this period,
  as reported by the original source. May include different types of
  missing values as reported by the original source.

## Source

<https://github.com/canmod/iidda>
