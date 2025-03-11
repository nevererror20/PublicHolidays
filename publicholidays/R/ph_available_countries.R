#' Get available countries
#'
#' @return A tibble with available countries.
#' @export
#'
#' @examples
#' ph_available_countries()
ph_available_countries <- function() {
  base_url <- "https://date.nager.at/api/v3/AvailableCountries"
  req <- httr2::request(base_url) |>
    httr2::req_user_agent("nagerdate (https://github.com/krose/nagerdate)")
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
  resp
}
