#' @title Unzips folders in a specified directory
#' @description Will auto-perform unzipping if files are not already decompressed necessary. Option to overwrite (and re-decompress) existing files (see arg `overwrite`).
#' @param zip_files Data frame containing columns c("filename" ,"abbrev","ftype","path_retrieve","path_save_new")
#' @param overwrite Logical. Default=FALSE. Will not overwrite already decompressed files with the same name.

unzip_data <- function(abbrevs, overwrite=FALSE){

  # Get the data frame containing the zipfiles.
  zip_files <- get_zipfiles(abbrevs)



# unzip each directory in command line since i cant get the chunk following this to work properly outside this function...idfk
# for (i in 1:nrow(zip_files)) {
#   cmd <- paste0("unzip ", zip_files$path_retrieve[i], " -d ", zip_files$path_save_new[i])
#   system(command=cmd)
# }

# now, unzip each file if necessary
for (i in 1:nrow(zip_files)) {
  message("....unzipping (or not!) file ", zip_files$filename[i], "....")
  # test=paste0("data/data-raw/test",i)
  unzip(
    zipfile = zip_files$path_retrieve[i],
    # exdir=test,
    exdir =  zip_files$path_save_new[i],
    junkpaths = TRUE,
    overwrite = overwrite
  )
} # Unzip some files...

return(zip_files)

} # end fucntion
