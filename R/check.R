#' Make a Class Check Function
#'
#' Construct a function to check an arguments class.
#'
#' @param cls Name of the target class.
#' @param suggest Function of the argument name giving suggested code
#' to help the user solve a class-mismatch problem. The result of this
#' function will be passed to `sprintf` to produce a sentence of the form
#' "Try %s to get %s %s" -- see the code below for context.
#'
#' @noRd
make_class_checker = function(cls, suggest = \(arg) character(0L)) {
  function(value, arg, fn = character()) {
    if (!inherits(value, cls)) {
      input_cls = flatten_class(value)
      throw_error(
          sprintf("`%s` should be %s %s", arg, choose_article(cls), cls)
        , sprintf("`%s` is %s %s", arg, choose_article(input_cls), input_cls)
        , sprintf("Try %s to get %s %s", suggest(arg), choose_article(cls), cls)
        , point_to_help(fn, arg)
      )
    }
    NULL
  }
}


#' Check Functions
#'
#' Functions to check arguments.
#'
#' Check functions should only be called at the top of user-exposed functions.
#'
#' @param value Argument value.
#' @param arg Argument name from a function signature that is ultimately.
#' responsible for any failures, so that the generated message makes
#' sense to the user.
#' @param fn Name of the function containing `arg`
#' @param arg_list A named list of arguments, for check functions that
#' check more than one argument at a time.
#' @return `NULL` or stops with an error message.
#'
#' @details
#' Check functions that check one argument at a time must use the following
#' signature.
#'
#' ```
#' check_{type_name} = function(value, arg, fn)
#' ```
#'
#' Check functions that check more than one argument at a time must use the
#' following signature.
#'
#' ```
#' check_{type_name} = function(arg_list, fn)
#' ```
#'
#' @noRd
check_vizid = make_class_checker(
    cls = "vizid"
  , suggest = \(arg) sprintf("`init_vizid(%s)`", arg)
)
check_data_frame = make_class_checker( ## function factory
    cls = "data.frame"
  , suggest = \(arg) sprintf("`as.data.frame(%s)`", arg)
)
check_roles = make_class_checker( ## function factory
    cls = "vizid_roles"
  , suggest = \(arg) "the `init_roles` function"
)
check_init_roles = function(arg_list, fn) {
  get_msg_for_one_arg = function(value, arg) {
    msg = character()

    if (!is_string(value)) {
      template = "%s must be a string giving a column name"
      msg = append(msg, sprintf(template, arg))
    }

    if (!arg %in% list_role_args()) {
      template = "%s is not a valid variable role"
      msg = append(msg, sprintf(template, arg))
    }

    return(msg)
  }

  msg = character()
  for (arg in names(arg_list)) {
    value = arg_list[[arg]]
    msg = append(msg, get_msg_for_one_arg(value, arg))
  }

  if (length(msg) > 0L) {
    msg = append(msg, point_to_help("roles"))
    throw_error(msg)
  }

  NULL
}
check_components = function(value, arg, fn) NULL




is_string = function(x) {
  isTRUE(is.character(x) & (length(x) == 1L))
}



# utilities for this file

## process `class()` output for
## inclusion in error messages
flatten_class = function(x) {
  cls = (x
    |> class()

    # remove namespace
    |> strsplit("::")
    |> lapply(rev)
    |> lapply(getElement, 1L)

    # flatten
    |> unlist(recursive = TRUE, use.names = FALSE)
    |> unique()
    |> as.character()
  )
}
choose_article <- function(words) {
  words <- trimws(words)
  first <- tolower(substr(words, 1, 1))
  vowels <- c("a", "e", "i", "o", "u")

  # exceptions to the rule that `an` _only_
  # proceeds words that start with a vowel
  # (add other exceptions as needed)
  exceptions_an <- c(
    "^[s|r][0-9]_?"  ## for S3, S4, R6, etc ... (e.g., S7_object from ggplot2)
  ) |> lapply(grepl, words, ignore.case = TRUE)

  # if matches exception, or starts with vowel
  needs_an <- Reduce(`|`, exceptions_an) | first %in% vowels

  ifelse(needs_an, "an", "a")
}
point_to_help = function(fn, arg = NULL) {
  msg = sprintf("See ?%s for help", fn)
  if (is.null(arg)) msg = sprintf("%s on setting the %s argument", msg, arg)
  return(msg)
}
convert_items_to_str = function(lst) {
  (lst
    # make sure it works with 'exotic' lists (e.g., pairlists)
    |> as.list()

    # make sure expressions are character vectors
    |> rapply(deparse, classes = "expression", how = "replace")

    # make sure everything else is a character vector
    |> rapply(as.character, how = "replace")
  )
}
