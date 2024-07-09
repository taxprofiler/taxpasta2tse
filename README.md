
<!-- README.md is generated from README.Rmd. Please edit that file -->

# taxpasta2tse

<!-- badges: start -->
<!-- badges: end -->

**N.B.: The functionality presented here, was [merged into the `mia`
R-package](https://github.com/microbiome/mia/pull/574) and is available
as the
[`mia::importTaxpasta`](https://microbiome.github.io/mia/reference/importTaxpasta.html)
function from version `1.13.28`. Development here is discontinued.**

`taxpasta2tse` provides convenience functions that load taxpasta output
(primarily in BIOM format) into a TreeSummarizedExperiment (TSE) object
with a correctly formatted taxonomic tree.

## Installation

You can install the development version of taxpasta2tse like so:

``` r
devtools::install_github("https://github.com/taxprofiler/taxpasta2tse")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
tse <- taxpasta2tse::load_biom("your-file.biom")
```

## Copyright

- Copyright © 2024, Moritz E. Beber.
- Free software distributed under the [Apache Software License
  2.0](LICENSE.md).
