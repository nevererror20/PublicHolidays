library(testthat)

test_that("ph_public_holidays returns holidays for the US in 2023", {
  holidays <- ph_public_holidays("US", 2023)
  expect_true(tibble::is_tibble(holidays))
  expect_true("date" %in% colnames(holidays))
  expect_true("name" %in% colnames(holidays))
})
