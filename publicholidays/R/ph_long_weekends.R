#' Get long weekends for a country in a given year
#'
#' @param country_code Country code.
#' @param year Year.
#' @return A tibble with long weekends.
#' @export
#'
#' @examples
#' ph_long_weekends("DE", 2025)
ph_long_weekends <- function(country_code, year) {
  base_url <- paste0("https://date.nager.at/api/v3/LongWeekend/", year, "/", country_code)
  req <- httr2::request(base_url) |>
    httr2::req_user_agent("nagerdate (https://github.com/krose/nagerdate)")
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
  resp
}
