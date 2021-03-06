test_that("generate_css works", {
  vcr::use_cassette("generate_css", {
    tmp <- tempfile(fileext = ".css")
    css <- generate_css(id = "roboto", variants = "regular", output = tmp)

    expect_is(css, "character")
    expect_true(nchar(css) > 0)
    expect_true(grepl(pattern = "font-family: 'Roboto';", x = css))
  })
})


# test_fonts <- sample(gfonts:::fonts$id, size = 10)
# test_fonts <- lapply(
#   X = test_fonts,
#   FUN = get_font_info
# )
# saveRDS(object = test_fonts, file = "inst/testdata/fontsinfo.rds")


test_that("glue_css works", {
  fontsinfo <- readRDS(file = system.file("testdata/fontsinfo.rds", package = "gfonts"))
  lapply(
    X = fontsinfo,
    FUN = function(x) {
      css <- glue_css(x)
      expect_is(css, "character")
      expect_true(nchar(css) > 0)
    }
  )
})


