#' @description An internal function for getting various filetypes into memory. Called from inside `import_data`
#' @title Retrieve multiple filetypes from disk.
#' @param
#' @param
#' @param
#' @param

get_data <- function(){

  data("spatial_data_types")
  unique(spatial_data_types$name)

## define options for common spatial data types
data.frame(
  name=c("shapefile"), functions=c("","")

)

}
