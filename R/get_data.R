#' @description An internal function for getting various filetypes into memory. Called from inside `import_data`
#' @title Retrieve multiple filetypes from disk.
#' @param guesses A data frame with variables `geo_data_type` higher level type of spatial data(e.g., vector, raster, metadata), `name` name of the type of spatial data (e.g., shapefile, geojson), and `path_save_new` relative path of the subdirectory (folder) of the file
#' @param
get_data <- function(guesses){

data("spatial_data_funs")

funs <- spatial_data_funs %>%
  filter(preferred==TRUE)

## merge the files with the preferred functions
how_to_get_data <- merge(guesses, funs)

# Define importation package::fun; install the package if not already.
  list.of.packages <- unique(how_to_get_data$package) %>% as.character()
  # install and load package if not install from GitHub
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)

# create a data frame containing the import functions + file attributes
to_import <- how_to_get_data %>%
    filter(fun_desc=="import")
for(i in 1:nrow(to_import)){
  if(i==1) nd <- NULL
  tmp <- data.frame(fn=list.files(to_import$path_save_new[i], full.names = TRUE, pattern= paste0("\\",how_to_get_data$extension[1],"$")),
        test="test")


  }

  # shps <- import_funs %>% filter(name=="shapefile")
  #   if(i==1) shps_temp<-NULL
  #   temp_shps <- c(shps_temp, list.files(shps$path_save_new[i], "\\.shp$", full.names=TRUE))
  #
  # }



  # if(!(pkg %in% installed.packages())){
  #   ### install from cran
  #     if(toupper(pkg_src)!="CRAN"){install.packages(pkg)}else(devtools::install_github(pkg_src))
  # }
  #

return(how_to_get_data)
}

