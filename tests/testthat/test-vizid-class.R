test_that("empty data can be converted to a vizid object", {
  empty_vizid = init_vizid(data.frame())
  empty_metadata = attr(empty_vizid, "vizid")
  
  expect_s3_class(empty_vizid, "vizid")
  expect_s3_class(empty_metadata, "vizid_metadata")
  expect_s3_class(empty_metadata$roles, "vizid_roles")
  expect_s3_class(empty_metadata$components, "vizid_components")
})
