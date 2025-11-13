print_msg = function(...) {
  (list(...)
    |> convert_items_to_str()
    |> unlist(recursive = TRUE, use.names = FALSE)
    |> trimws()
    |> paste(collapse = "\n")
  )
}

process_usr_msg = function(...) {
  bullet_list = \(x) paste("- ", x, sep = "")
  (list(...)
    |> convert_items_to_str()

    # create character vector out of the potentially
    # nested list of character vectors
    |> unlist(recursive = TRUE, use.names = FALSE)

    |> trimws()
    |> bullet_list()
    |> paste(collapse = "\n")
    |> append("\n", after = 0)
  )
}

throw_message = function(...) process_usr_msg(...) |> message()
throw_error   = function(...) process_usr_msg(...) |> stop(call. = FALSE)
throw_warning = function(...) process_usr_msg(...) |> warning(call. = FALSE)


# utilities for this file

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
