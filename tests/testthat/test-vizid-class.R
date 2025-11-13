test_that("empty data can be converted to a vizid object", {
  empty_vizid = init_vizid(data.frame())
  empty_metadata = attr(empty_vizid, "vizid")
  
  expect_s3_class(empty_vizid, "vizid")
  expect_s3_class(empty_metadata, "vizid_metadata")
  expect_s3_class(empty_metadata$roles, "vizid_roles")
  expect_s3_class(empty_metadata$components, "vizid_components")
})

test_that("roles can be setted and getted", {
  data("smallpox_ontario")
  smallpox = init_vizid(smallpox_ontario)
  expect_s3_class(vizid:::get_role(smallpox, "series_variable"), "waiver")
  vizid:::set_role(smallpox, "series_variable", "cases_this_period")
  expect_equal(vizid:::get_role(smallpox, "series_variable"), "cases_this_period")
})
