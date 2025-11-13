# Create a `vizid` Object

Create a `vizid` Object

## Usage

``` r
init_vizid(data, roles = init_roles(), components = init_components())
```

## Arguments

- data:

  A data frame with infectious disease data.

- roles:

  An object produced by
  [`init_roles`](https://canmod.github.io/vizid/reference/init_roles.md),
  which maps variable roles to specific names of variables in `data`
  and/or the return values of data.

- components:

  An object produced by `init_components`, which stores `ggplot2`
  components (e.g., the results of functions like `geom_line()` and
  `scales_x_continuous()`) that would be combined into a plot if the
  vizid object is passed to the
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html).

## Value

A data frame of class `"vizid"` that knows what roles its variables will
plot in a visualization. These roles are stored in attributes. These
attributes also contains an initially empty list, `plot_components`,
that can be filled up with `ggplot2` plot components that can be used
when the `plot` function is called.
