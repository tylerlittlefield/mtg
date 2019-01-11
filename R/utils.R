resp_info <- function(request) {
  req_url <- request[["url"]]
  status <- request[["status_code"]]
  content_type <- request[["headers"]][["content-type"]]

  x <- glue::glue(crayon::bold(" Request: "), req_url)
  y <- glue::glue(crayon::bold(" Status: "), status)
  z <- glue::glue(crayon::bold(" Content-Type: "), content_type)

  is_success <- !httr::http_error(request)
  if(is_success) {
    cat(
      glue::glue(
        crayon::green(cli::symbol$tick), x, "\n",
        crayon::green(cli::symbol$tick), y, "\n",
        crayon::green(cli::symbol$tick), z, "\n\n"
      )
    )
  } else {
    cat(
      glue::glue(
        crayon::red(cli::symbol$cross), x, "\n",
        crayon::red(cli::symbol$cross), y, "\n\n",
      )
    )
  }
}
