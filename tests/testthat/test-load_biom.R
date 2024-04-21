test_that("a well-formed taxpasta BIOM file can be loaded without error", {
  expect_no_error(taxpasta2tse::load_biom(test_path("data", "result.biom")))
})

test_that("loading a taxpasta BIOM file without taxonomy information generates a warning", {
  expect_warning(taxpasta2tse::load_biom(test_path("data", "no_taxonomy.biom")))
})

test_that("loading a taxpasta BIOM file where the rank lineage does not match taxonomy columns generates an error", {
  expect_error(taxpasta2tse::load_biom(test_path("data", "faulty_taxonomy.biom")))
})

result <- taxpasta2tse::load_biom(test_path("data", "result.biom"))

test_that("loading a taxpasta BIOM file returns a TreeSummarizedExperiment", {
  expect_s4_class(result, "TreeSummarizedExperiment")
})

test_that("the TreeSummarizedExperiment has expected dimensions", {
  expect_identical(dim(result), c(43L, 2L))
})
