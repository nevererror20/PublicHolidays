#' Get country info
#'
#' @param country_code Country code.
#' @return A tibble with country information.
#' @export
#'
#' @examples
#' ph_country_info("DE")
ph_country_info <- function(country_code) {
  base_url <- paste0("https://date.nager.at/api/v3/CountryInfo/", country_code)
  req <- httr2::request(base_url) |>
    httr2::req_user_agent("nagerdate (https://github.com/krose/nagerdate)")
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON()
  tibble::tibble(
    commonName = resp$commonName,
    officialName = resp$officialName,
    countryCode = resp$countryCode,
    region = resp$region,
    borders = list(resp$borders)
  )
}
