#' Retrieve Public Holidays for a Country in a Given Year
#'
#' @param country_code Country code (e.g., "DE" for Germany).
#' @param year Year (e.g., 2025).
#' @return A tibble with public holidays.
#' @export
#'
#' @examples
#' ph_public_holidays("DE", 2025)
ph_public_holidays <- function(country_code, year) {
  base_url <- paste0("https://date.nager.at/api/v3/PublicHolidays/", year, "/", country_code)
  req <- httr2::request(base_url) |>
    httr2::req_user_agent("nagerdate (https://github.com/krose/nagerdate)")
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
  resp
}
