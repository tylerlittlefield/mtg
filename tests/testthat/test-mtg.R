context("test-mtg")

test_that("mtg works", {
  expect_equal(class(mtg("cards", quiet = TRUE)), "list")
  expect_equal(class(mtg("cards", json = TRUE, quiet = TRUE)), "json")
  expect_error(mtg("cardz", quiet = TRUE))
  expect_silent(mtg("cards", quiet = TRUE))
})
