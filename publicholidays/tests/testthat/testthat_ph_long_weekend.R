test_that("ph_long_weekends returns a tbl_df with expected columns", {
  # call func
  result <- ph_long_weekends("DE", 2025)

  # check dtype
  expect_s3_class(result, "tbl_df")

  # check columns
  expected_columns <- c("startDate", "endDate", "dayCount", "needBridgeDay", "bridgeDays")
  expect_equal(names(result), expected_columns)

  # check values
  expect_type(result$startDate, "character")
  expect_type(result$endDate, "character")
  expect_type(result$dayCount, "integer")
  expect_type(result$needBridgeDay, "logical")
})
