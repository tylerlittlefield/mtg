#' Eresponsetract Magic the Gather Data
#' @description Main function to grab data from Magic the Gathering API.
#' @param resource Request resource, i.e. the endpoint
#' @param version The API version, defaults to \code{v1}
#' @param json If TRUE the output returns a JSON object. If FALSE the output
#' returns a R object. Defaults to FALSE.
#' @param quiet If TRUE the response information is printed. If FALSE, the
#' response information is not printed. Defaults to TRUE.
#' @export
mtg <- function(resource, version = "v1", json = FALSE, quiet = FALSE) {
  request <- glue::glue("https://api.magicthegathering.io/{version}/{resource}")
  response <- httr::GET(request)

  if(!quiet)
    resp_info(response)

  if(httr::http_error(response))
    stop(httr::http_status(response)[["message"]])

  response <- httr::content(response) # grab the request content

  if(json) {
    jsonlite::toJSON(response, pretty = TRUE)
  } else {
    response <- jsonlite::toJSON(response)
    jsonlite::fromJSON(response)
  }
}
