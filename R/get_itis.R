#' #' @title Retrieve ITIS data for class Aves
#' #' @description Uses the R package `taxize` to retrieve and munge relevant taxomomic records for birds.
#' #' @param
#'
get_itis <- function(){
    require(taxize)

  taxize::downstream("Aves", downto = "Species", db = "itis")
  downstream("Apis", downto = "Species", db = "col")
}
