# Contributing to vizid

This outlines how to propose a change to `vizid`.

We generally follow the [tidyverse style guide](https://tidyverse.tidyverse.org/CONTRIBUTING.html), while applying it flexibly rather than rigidly. The remainder of this document outlines where our conventions differ from those of the tidyverse.

## Object Naming Conventions

* All names must use [snake_case](https://en.wikipedia.org/wiki/Snake_case).
* Non-function objects must be named as nouns.
* Functions that return logical values must have names that ask questions (e.g., `is_string()`).
* Functions that define standard variable role assignments must be of the form `std_{role}_variables()`.
* All other functions should be named as verbs describing what they do when applied.
* Argument names must also follow this convention:
  * Non-function-valued arguments must be named as nouns.
  * Function-valued arguments must be named like functions.
* Function-valued arguments should have defaults produced using [function factories](https://adv-r.hadley.nz/function-factories.html), which are functions that produce other functions.
* Function factories must be named by converting the name of the object that will be assigned their return value into a noun and prefixing it with `make_`.
  * The noun form must describe the kind of function being created.
  * For example, `handle_missing = make_missing_handler(...)`.
* Data structure constructors must be named by prefixing the structure name with `init_` (short for initialize)
* Functions that take data and return plot components must be named by prefixing the component name with the special verb, `build_`.

## Code of Conduct

Please note that the vizid project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this
project you agree to abide by its terms.
