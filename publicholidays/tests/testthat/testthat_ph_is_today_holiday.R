test_that("ph_is_today_holiday returns a logical value", {
  # test holiday
  mock_date <- "2025-01-01"
  mock_holidays <- tibble::tibble(date = c("2025-01-01", "2025-04-18", "2025-12-25"))
  with_mock(
    Sys.Date = function() as.Date(mock_date),
    ph_public_holidays = function(country_code, year) mock_holidays,
    {
      expect_true(ph_is_today_holiday("DE"))
    }
  )

  # test not holiday
  mock_date <- "2025-01-02"
  with_mock(
    Sys.Date = function() as.Date(mock_date),
    ph_public_holidays = function(country_code, year) mock_holidays,
    {
      expect_false(ph_is_today_holiday("DE"))
    }
  )
})
