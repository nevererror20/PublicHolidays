# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(publicholidays)

test_that("ph_available_countries returns a tbl_df", {
  result <- ph_available_countries()
  expect_s3_class(result, "tbl_df")
})
