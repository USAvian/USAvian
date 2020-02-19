#' @param abbrevs Abbreviations for which to search for files in dir_retrieve. Also used to save files in dir_retrieve.
#' @param dir_retrieve Directory location for retrieving the original, raw data to be decompressed. Defaults to `data/data-raw`, which is the default save directory for function `download_data`.
get_zipfiles <- function(
                        abbrevs = NULL,
                        dir_retrieve = 'data/data-raw',
                        overwrite = FALSE
                        ) {
  # save a list of files in dirs of interest
  # by removing  subdirectory folders (i.e. the files wihtout extensions...presumably)
  files <-
    list.files(dir_retrieve, full.names = FALSE)[grepl("\\.", list.files(dir_retrieve))]
  #
  # # # if no files exist in dir_rda throw error
  # if(!length(files)>0){
  #   errir(
  #     "No files exist in `dir_retrieve` (",
  #     dir_retrieve,
  #     "). \n Abandoning process `import_data()`"
  #   )}

  # Create df containing desired filenames or abbreviations
  if (!exists("data_sources")){
    data("data_sources")}
  if (is.null(abbrevs)) {
    # if the abbreviations are undefined then just list all that we know of...
    abbrevs <- unique(data_sources$abbrev)
  }

  # Loop over every abbreviation to identify the file names associated with that data
  for (i in seq_along(abbrevs)) {
    if (i == 1)
      files_matched <- NULL
    # ID filenames with matching indices (e.g. abbrevs)
    files_matched <-
      c(files_matched, grep(abbrevs[i], files, value = TRUE)) %>% unique()
  }

# Create a df comprising files_matched and abbreviations  containing files to unzip
  zip_files <-
    data.frame(filename = files_matched) %>%
    mutate(abbrev = sub("\\..*", "", filename)) %>% # get abbreviation and save as a variable
    mutate(ftype = tools::file_ext(sub("\\?.+", "", files_matched))) %>% # get filetype from filename and add as new col
    mutate(path_retrieve = paste0(dir_retrieve, "/", filename)) %>%  # append full path to retrieve file
    mutate(path_save_new = paste0(dir_retrieve, "/", gsub("\\..*", "", filename))) %>%  # append full path for storing the new file
    mutate_if(is.factor, as.character) %>%
    filter(ftype == "zip") # which files are zipped


  return(zip_files)

} #end function
