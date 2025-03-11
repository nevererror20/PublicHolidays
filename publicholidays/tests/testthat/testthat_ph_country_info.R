test_that("ph_country_info returns a tbl_df with expected columns", {
  # call func
  result <- ph_country_info("DE")
  expect_s3_class(result, "tbl_df")

  # test columns
  expected_columns <- c("commonName", "officialName", "countryCode", "region", "borders")
  expect_equal(names(result), expected_columns)

  # test datatype
  expect_type(result$commonName, "character")
  expect_type(result$officialName, "character")
  expect_type(result$countryCode, "character")
  expect_type(result$region, "character")
  expect_type(result$borders, "list")
})
