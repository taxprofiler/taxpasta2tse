#' Load BIOM format file to TreeSummarizedExperiment
#'
#' @param filename A character vector with one element that denotes the file path
#'    to a BIOM file.
#'
#' @return A TreeSummarizedExperiment object
#' @export
#'
#' @examples
#' tse <- load_biom("profiles.biom")
load_biom <- function(filename) {
  result <- mia::loadFromBiom(filename)
  meta <- SummarizedExperiment::rowData(result)
  column_names <- colnames(meta)
  if ("rank_lineage" %in% column_names) {
    ranks <- meta[["rank_lineage"]] |>
      max() |>
      strsplit(";", fixed = TRUE) |>
      base::`[[`(1)
    indeces <- startsWith(column_names, "taxonomy")
    if (sum(indeces) != length(ranks)) {
      stop("The number of generic taxonomy* columns differs from the number of ranks in the lineage.")
    }
    colnames(meta) <- replace(column_names, indeces, ranks)
    SummarizedExperiment::rowData(result) <- meta
    utils::assignInNamespace("TAXONOMY_RANKS", ranks, ns = asNamespace("mia"))
    mia::splitByRanks(result)
    mia::addTaxonomyTree(result)
  } else {
    simpleWarning("The BIOM file does not contain taxonomy information; unable to generate a taxonomic tree.")
  }
  return(result)
}
