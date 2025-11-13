library(iidda.api)
library(dplyr)
smallpox_ontario = iidda.api::featured_data(
     "canmod-cdi-normalized"
   , disease = "smallpox"
   , iso_3166_2 = "CA-ON"
) |> select(
    period_start_date, period_end_date, days_this_period
  , population, cases_this_period
)

if (interactive() & require(ggplot2)) {
  (smallpox_ontario
     |> ggplot()
     + aes(x = as.Date(period_end_date), y = as.numeric(cases_this_period))
     + geom_line()
  )
}
usethis::use_data(smallpox_ontario, overwrite = TRUE)
