init_components = function() structure(list(), class = "vizid_components")

#' @exportS3Method base::print
print.vizid_components = function(x, ...) {
  cat("No plot components have been built")
}
