#' @description An internal function for getting various filetypes into memory. Called from inside `import_data`
#' @title Retrieve multiple filetypes from disk.
#' @param guesses A data frame with variables `abbrev` abbreviation for the dataset, `geo_data_type` higher level type of spatial data(e.g., vector, raster, metadata), `name` name of the type of spatial data (e.g., shapefile, geojson), and `path_save_new` relative path of the subdirectory (folder) of the file
#' @param
get_data <- function(guesses){

if(!exists("spatial_data_funs")) data("spatial_data_funs")

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
how_to_import <- how_to_get_data %>%
    filter(fun_desc=="import") %>%
  mutate_if(is.factor, as.character)

for(i in 1:nrow(how_to_import)){
if(i==1) spatial_data <- list()

    ftype <- how_to_import$name
    pkg <- how_to_import$package

    file_to_import<-
        list.files(
          path = how_to_import$path_save_new[i],
          full.names = TRUE,
          pattern = paste0("\\", how_to_import$extension[i], "$")
        )

    # names(spatial_data[[i]])  <- how_to_import$abbrev[i]

    if(ftype=="shapefile" & pkg=="sf"){
      spatial_data[[i]] <- sf::st_read(dsn = file_to_import)
    }


 }

  # shps <- import_funs %>% filter(name=="shapefile")
  #   if(i==1) shps_temp<-NULL
  #   temp_shps <- c(shps_temp, list.files(shps$path_save_new[i], "\\.shp$", full.names=TRUE))
  #
  # }

return(how_to_get_data)
}

