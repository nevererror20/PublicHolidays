test_that("ph_public_holidays returns a tbl_df with expected columns", {
  # call func
  result <- ph_public_holidays("DE", 2025)

  # check dtype
  expect_s3_class(result, "tbl_df")

  # check columns
  expected_columns <- c("date", "localName", "name", "countryCode", "fixed", "global", "counties", "launchYear", "types")
  expect_equal(names(result), expected_columns)

  # check dtype of columns
  expect_type(result$date, "character")
  expect_type(result$localName, "character")
  expect_type(result$name, "character")
  expect_type(result$countryCode, "character")
  expect_type(result$fixed, "logical")
  expect_type(result$global, "logical")
  expect_type(result$counties, "list")
  expect_type(result$launchYear, "logical")
  expect_type(result$types, "list")
})
