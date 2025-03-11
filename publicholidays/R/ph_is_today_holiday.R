#' Check if Today is a Public Holiday in a Specific Country
#'
#' @param country_code Country code (e.g., "DE" for Germany).
#' @return A logical value: TRUE if today is a public holiday, FALSE otherwise.
#' @export
#'
#' @examples
#' ph_is_today_holiday("DE")
ph_is_today_holiday <- function(country_code) {
  # get today's date
  today <- format(Sys.Date(), "%Y-%m-%d")

  # build API url
  base_url <- paste0("https://date.nager.at/api/v3/PublicHolidays/", format(Sys.Date(), "%Y"), "/", country_code)
  req <- httr2::request(base_url) |>
    httr2::req_user_agent("nagerdate (https://github.com/krose/nagerdate)")

  # send req
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()

  # check today is holiday or not
  today %in% resp$date
}
