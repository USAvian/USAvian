#' @title Categorize the decompressed files to identify vector vs. raster, and extensions.
#' @description
#' @param files A data frame with columns c("filename","abbrev","ftype","path_retrieve","path_save_new"). This will be the data frame output from `unzip_files`.
categorize_data <- function(
  files=zip_files){
# Categorize each unzipped directory (in data_avaialbility) to understand the files we are dealing with...----
for (i in 1:nrow(zip_files)) {
  if (i == 1){ data_types <- data.frame()} # create empty df at first loop
  fns = list.files(zip_files$path_save_new[i]) # filenames
  exts = tools::file_ext(sub("\\?.+", "", fns)) # file extensions
  dir_path = zip_files$path_save_new[i] # location of subdir files
  # create df and store in the list
  tmp <-
    data.frame(fns, exts, dir_path, abbrev = zip_files$abbrev[i])%>%
    mutate_if(is.factor, as.character) # munge the resulting  data_types object to avoid dfactors...annoying!
  # merge new infomation to old (or empty data frame containing results from all j loops)
  data_types <- bind_rows(tmp, data_types)
  rm(tmp, fns, exts, dir_path) #clear junk
} # end i-loop categorizing data

# Now guess the filetype based on the majority of files extentions in directory
## i.e. based on what files (col:`exts`) are present in each subdirectory
if (!exists("spatial_data_types")){data("spatial_data_types")}

# Loop over each subdirectory to classify the filetypes to guess filetypes
for (i in seq_along(unique(data_types$dir_path))) {
  if (i == 1)
    guesses <- NULL

  # get unique files which exist in the directory
  tmp <-
    data_types %>%
    filter(dir_path == unique(data_types$dir_path)[i]) %>%
    distinct(exts, abbrev)
  # see where overlap is among filetypes, keep only required files
  suppressWarnings(
    t <- inner_join(tmp, spatial_data_types, by = 'exts') %>%
      filter(required == "TRUE") %>%
      dplyr::select(geo_data_type, name, abbrev))

  if (nrow(t) == 0) {
    warning(
      "None of the file extensions in dir ",
      unique(tmp$dir_path),
      " match my knowledge. You will need to do one of the following:",
      "\n  - Ignore me (-50XP)\n  - Update the entry in spatial_data_types (not recommended; +100XP)\n  - Report an Issue (github.com/trashbirdecology/usavian/issues) re: this data(+100XP)\n  - Manually import this data (+50XP)`"
    )
    rm(tmp, t)
    next()
  }
  # make an educated guess based on which has the most votes
  max_name  <-  t[max(plyr::count(t$name)$freq), ]
  guess <- data.frame(max_name,
                      path_save_new  =  unique(data_types$dir_path)[i])

  suppressWarnings(guesses  <-  bind_rows(guess, guesses))
  rm(guess, tmp, t)
} #end loop

return(guesses)
}
