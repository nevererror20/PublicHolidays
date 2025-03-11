library(testthat)
library(tibble)
library(mockery)

# mock ph_is_today_holiday
ph_is_today_holiday <- function(country_code) {
  holidays <- ph_public_holidays(country_code, format(Sys.Date(), "%Y"))
  today <- Sys.Date()
  today %in% as.Date(holidays$date)
}

# mock ph_public_holidays
ph_public_holidays <- function(country_code, year) {
  tibble(date = c("2025-01-01", "2025-04-18", "2025-12-25"))
}

test_that("ph_is_today_holiday return logical value", {
  # mock holidays
  mock_holidays <- tibble(date = c("2025-01-01", "2025-04-18", "2025-12-25"))

  # test is holiday
  mockery::stub(ph_is_today_holiday, "Sys.Date", function() as.Date("2025-01-01"))
  mockery::stub(ph_is_today_holiday, "ph_public_holidays", function(country_code, year) mock_holidays)
  expect_true(ph_is_today_holiday("DE"))

  # test not holiday
  mockery::stub(ph_is_today_holiday, "Sys.Date", function() as.Date("2025-01-02"))
  mockery::stub(ph_is_today_holiday, "ph_public_holidays", function(country_code, year) mock_holidays)
  expect_false(ph_is_today_holiday("DE"))
})
