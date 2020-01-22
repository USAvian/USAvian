#' @title Imports and optionally saves data (as .Rda) from a select directory
#' @description Import selected data into R memory. Will auto-perform unzipping if necessary. Option to save the data objects as .Rda files (`save_rda`).
#' @param dir_rda Directory location for storing the R data objects. Defaults to `data/data-raw/data-rda`
#' @param dir_retrieve Directory location for retrieving the original, raw data. Defaults to `data/data-raw`
#' @param filenames Filenames of the data to import. Defaults to the values in `data_sources$abbrev`
#' @param abbrevs Abbreviations for which to search for files in dir_retrieve. Also used to save files in dir_retrieve.
#' @param save_rda Logical. TDefault=TRUE. Saves the imported data as .rda for quick retrieval. Saves to location `dir_rda`.
#' @param overwrite Logical. Default=FALSE. Will not overwrite already decompressed files with the same name.

import_data <- function(
  dir_rda='data/data-raw/data-rda',
  dir_retrieve='data/data-raw',
  filenames= NULL,
  abbrevs=NULL,
  overwrite=FALSE,
  save_rda=TRUE
){
# create a subdir for storing local data based on param "dir"
suppressWarnings(dir.create(dir_rda))

# save a list of files in dirs of interest
 # by removing  subdirectory folders (i.e. the files wihtout extensions...presumably)
 files <- list.files(dir_retrieve)[grepl("\\.", list.files(dir_retrieve))]

# if no files exist in dir_rda throw error
if(!length(files>0)) stop("No files exist in `dir_retrieve` (", dir_retrieve, "). \n Abandoning process `import_data()`")

# Create df containing desired filenames or abbreviations
if(!exists("data_sources")) data("data_sources")
if(is.null(abbrevs)){ # if the abbreviations are undefined then just list all that we know of...
  abbrevs<-unique(data_sources$abbrev)
  }

# Loop over every abbreviation to identify the file names associated with that data
for(i in seq_along(abbrevs)){
if(i==1) files_matched <- NULL
  # ID filenames with matching indices (e.g. abbrevs)
  files_matched <- c(files_matched, grep(abbrevs[i], files, value=TRUE)) %>% unique()
  }

# Create a df comprising files_matched
data_availablity <- data.frame(abbrev=abbrevs, filename=files_matched) %>%
 mutate(ftype = tools::file_ext(sub("\\?.+", "", files_matched))) %>% # get filetype from filename and add as new col
  mutate(path_retrieve = paste0(dir_retrieve, "/",filename)) %>%  # append full path to retrieve file
  mutate(path_save_new = paste0(dir_retrieve,"/", gsub("\\..*","",filename))) %>%  # append full path for storing the new file
  mutate_if(is.factor, as.character)

# UNZIP FILES ----
zip_files <- data_availablity %>% filter(ftype=="zip") # which files are zipped
for(i in 1:nrow(zip_files)){
  #unzip file i
  unzip(zipfile = zip_files$path_retrieve[i], exdir =  zip_files$path_save_new[i],
        junkpaths = TRUE,
        overwrite = overwrite)
      }# Unzip some files...

# Categorize the data to understand wtf we are dealing with...----
for(i in 1:nrow(data_availablity)){
    if(i==1) data_types <- data.frame() # create empty df at first loop
    fns=list.files(data_availablity$path_save_new[j]) # filenames
    exts=tools::file_ext(sub("\\?.+", "", fns)) # file extensions
    dir_path=data_availablity$path_save_new[j] # location of subdir files
    # create df and store in the list
    tmp<-data.frame(fns, exts, dir_path, abbrev=data_availablity$abbrev[i])
    # merge new infomation to old (or empty data frame containing results from all j loops)
    suppressWarnings(data_types<-bind_rows(tmp, data_types))
    rm(tmp, fns, exts, dir_path) #clear junk
                          } # end i-loop categorizing data
        ## munge the resulting  data_types object to avoid dfactors...annoying!
        data_types <- data_types %>%
          mutate_if(is.factor, as.character)


# Guess which spatia data type the file(s) is(are) ---
# Predict filetypes based on what files (col:`exts`) are present in each subdirectory
if(!exists("spatial_data_types")) data("spatial_data_types")

  # Loop over each subdirectory to classify the filetypes to guess filetypes
for(i in seq_along(unique(data_types$dir_path))){
  if(i==1) guesses<-NULL

  # get unique files which exist in the directory
  tmp <-
    data_types %>%
      filter(dir_path == unique(data_types$dir_path)[i]) %>%
      distinct(exts, abbrev)
  # see where overlap is among filetypes, keep only required files
  suppressWarnings(t <- inner_join(tmp, spatial_data_types, by='exts') %>%
    filter(required=="TRUE") %>%
    dplyr::select(geo_data_type, name, abbrev))

  if(nrow(t)==0){ warning("None of the file extensions in dir ", unique(data_types$dir_path),
                         " match my knowledge (). You will need to do one of the following:",
"\n  - Ignore me (-50XP)\n  - Update the entry in spatial_data_types (not recommended; +100XP)\n  - Report an Issue (github.com/trashbirdecology/usavian/issues) re: this data(+100XP)\n  - Manually import this data (+50XP)`"
  )
    next()}
 # make an educated guess based on which has the most votes
  max_name<-t[max(plyr::count(t$name)$freq),]
  guess <- data.frame(max_name,
                      path_save_new=unique(data_types$dir_path)[i]
                      )

  suppressWarnings(guesses<-bind_rows(guess, guesses))
  rm(guess)
  } #end loop

# Get method importation definitions from function `USAvian::get_data()` ----
how_to_get_data <- get_data(guesses)


# Import each data and save as RDS locally --------------------------------------------------------
import_funs <- how_to_get_data %>% distinct(path_save_new, name, geo_data_type, package, package_fun, fun_desc) %>%
  filter(fun_desc=="import") %>%
  mutate(name = tolower(name))

### for Shapefiles
# do.call(what=sf::st_read, args=shps_temp)
#
#
# for(i in 1:nrow(import_funs)){
#   tmp <- import_funs[i,]
#  # get basic information for the do.call (same for every filetype)
#  path <- tmp$path_save_new
#  type <- tmp$name
#  pkg <- tmp$package
#  fun  <- tmp$package_fun
#  fun_full <- paste0(pkg, "::", fun)
#  # define the other crap for do.call() (changes based on filetype)
#
#
#
# }
#
# fun <- paste0(import_funs$package[i], "::",import_funs$package_fun[i], "(", other_crap,")"
#               )
#  # import each data based on filetype
 # do.call(what = fun, args)



# # Save the imported data as rdas ----
# if(save_rda) #bljbljljslbj save all files to rda

# Return a df containing all the data which is available, raw-data paths/filenames and new paths ----
  data_availablity <- merge(data_types, data_availablity, )
  return(data_availablity)

 }
