test_that("a taxpasta BIOM file can be loaded without error", {
  expect_no_error(taxpasta2tse::load_biom(test_path("data", "result.biom")))
})

result <- taxpasta2tse::load_biom(test_path("data", "result.biom"))

test_that("loading a taxpasta BIOM file returns a TreeSummarizedExperiment", {
  expect_s4_class(result, "TreeSummarizedExperiment")
})

test_that("the TreeSummarizedExperiment has expected dimensions", {
  expect_identical(dim(result), c(43L, 2L))
})
