#' Create a `vizid` Object
#'
#' @param data A data frame with infectious disease data.
#' @param roles An object produced by \code{\link{init_roles}}, which
#' maps variable roles to specific names of variables in `data` and/or the
#' return values of data.
#' @param components An object produced by \code{init_components}, which
#' stores `ggplot2` components (e.g., the results of functions like
#' `geom_line()` and `scales_x_continuous()`) that would be combined into a
#' plot if the vizid object is passed to the `plot()`.
#' @return A data frame of class `"vizid"` that knows what roles its variables
#' will plot in a visualization. These roles are stored in attributes. These
#' attributes also contains an initially empty list, `plot_components`, that
#' can be filled up with `ggplot2` plot components that can be used when the
#' `plot` function is called.
#' @export
init_vizid = function(data, roles = init_roles(), components = init_components()) {
  check_data_frame(data, "data", "vizid")
  check_roles(roles, "roles", "vizid")
  check_components(components, "components", "vizid")

  structure(data
    , class = data |> class() |> c("vizid")
    , vizid = init_vizid_metadata(roles, components)
  )
}

init_vizid_metadata = function(
    roles = init_roles()
  , components = init_components()
  ) {
  lst = list(roles = roles, components = components)
  structure(lst, class = "vizid_metadata")
}

#' @importFrom data.table setattr
#' @param data A `vizid` object.
#' @noRd
set_role = function(data, role, variable_name) {
  value = attr(data, "vizid")
  value$roles[[role]] = variable_name
  data.table::setattr(data, "vizid", value)
  invisible(data)
}
get_role = function(data, role) {
  attr(data, "vizid")$roles[[role]]
}
