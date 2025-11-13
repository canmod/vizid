# Design

``` r
library(vizid)
```

## Data Frames are Primary Objects

Many functions in this package are **transformers**: they take a data
frame and return a modified data frame. The data frame acts as the
single source of truth for both your **data** and the **state** of your
visualization session.

In this context, *state* refers to information stored in attributes—such
as:

- which variables should be used for which roles in the visualization
  (e.g., the `cases` variable should be the `series_variable` used in a
  time-series plot).
- `ggplot2` components that will be combined to produce a plot object.
- other metadata captured during previous steps that influences default
  plotting behaviour.

Because transformers carry this state forward, you use them in a
pipeline that ultimately produces a data frame ready for plotting.

``` r
vizid_object <- (data
  # transformers from other packages that you love
  |> non_vizid_functions()
  |> ...
  
  # transformers that modify data *and* carry forward state
  |> vizid_functions()     
  |> ...
)

data_frame_exploration_function(vizid_object)
plot(vizid_object)
```

One consequence of this design is that you can inspect the **data that
will be plotted** using all the standard R tools for examining data
frames ([`head()`](https://rdrr.io/r/utils/head.html),
[`summary()`](https://rdrr.io/r/base/summary.html), dplyr verbs, etc.).
This is intentional: the visible content of the data frame always
reflects the data that `vizid` will plot. Other aspects of the session
state—such as inferred variable roles, user-supplied choices, and
metadata collected along the way—are stored in **attributes**, which
ordinary data-frame tools ignore but which you can view with
[`attributes()`](https://rdrr.io/r/base/attributes.html) if needed.

If you want to insert your own transformation into a `vizid` pipeline,
you can write a custom transformer and wrap it using the helper provided
by `vizid`, ensuring that your function returns a modified data frame
**and** preserves all relevant `vizid` attributes.

The final step in a `vizid` pipeline is another data frame—one that
includes the information required to produce a plot. This aligns with
base R behaviour: `plot(data)` works for any data frame. `vizid` simply
ensures that, for historical infectious-disease data, the resulting plot
is informative and context-aware while still respecting the explicit
choices you make (e.g., selecting the correct series when multiple
candidates exist).
