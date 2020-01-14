#' @description Function provides an option to specify the data you want to download using URLs and desired filenames, or you can download files from our [Data Source List](https://github.com/TrashBirdEcology/USAvian/blob/master/data/data_sources.csv) and use the abbreviations to quickly download all desired data to file.
#' @title Download data from URL to local destination.
#' @param dir (optional) Directory for storing the downloaded data. Defaults to `data/data-raw`
#' @param url (optional) URL(s) character, single or vector, for data source locations.
#' @param fn (optional) Filename(s) corresponding to the name local filename of the downloaded data (do not include the extension).
#' @param abbrevs (Preferred) Abbreviations of select datasets (see col "abbrev" `data("data_sources")`)). Specifying this parameter is the preferred, and easier, method for downloading relevant data sources.
#' @examples
#' \donotrun{
#' # Download the persistent Bird Conservation Regions (BCR) compressed file.
#' download_data(abbrev="bcr_persistent")
#' }
#' @return NA. Files downloaded to local directory (as defined by `dir` parameter.)

download_data <- function(
  dir=NULL, # directory for storing downloaded data (defaults to data/data-raw)
  url=NULL, # character object or vector containing url locations of data
  fn=NULL, # what to name the new file(s). a single value or vector of values (e.g. "BCR". Do not specify extension)
  abbrevs=NULL #preferred method for downloading the data.
  ){
# NOTES
if(length(fn)!=length(url)) stop("`url` and `fn` lengths do not match. Please check to ensure same lengths.")

# throw error if 'abbrevs', 'url' and 'fn' ALL UNdefined
if(is.null(url) & is.null(fn)){
  if(is.null(abbrevs)){
    stop("`abbrevs`, `url` and `fn` = NULL. Please define both `abbrevs` and `fn` OR specify `abbrevs`")
  }
  }
# throw error if 'abbrevs', 'url' and 'fn' are ALL defined. Can't have everything defined....
if(!is.null(url) & !is.null(fn) & !is.null(abbrevs)) stop("Each of `abbrevs`, `url` and `fn` are defined. Please specify only `abbrevs` or both `url` and `fn` to proceed.")

# define the data directory location if NULL
if(is.null(dir)) dir <-here::here("data/data-raw")
suppressWarnings(dir.create(dir)) # creates directory if DNE

# if abbrevs are defined, load data_sources df and filter based on desired abbrevs.
if(!is.null(abbrevs)) {
  if(!exists("data_sources"))  data("data_sources")
  data_sources <- data_sources %>%
             filter(abbrev %in% abbrevs) %>%  #abbrev=colname in data_sources
            dplyr::select(abbrev, data_url, abbrev)
  }

# if abbrevs are undefined, make a df named sources comprising fn and url values
if(is.null(abbrevs)){
data_sources <- data.frame(data_url=url, abbrev=fn)
}

## Housekeeping
# make sure variabes are not factors...le sigh
data_sources$data_url<-as.character(data_sources$data_url)
data_sources$abbrev<-as.character(data_sources$abbrev)

### Download the data. Throw warning that we will not overwrite the data if already exists for efficiency ###
for(i in 1:nrow(data_sources)){
  # browser()
  ftype <- tools::file_ext(sub("\\?.+", "", data_sources$data_url[i])) # get filetype from url
  ## Warning:I refuse to overwrite existing data.
    if(paste0(data_sources$abbrev[i], ".",ftype) %in% list.files(dir)){
              message(paste0("File ",paste0(data_sources$abbrev[i], ".", ftype)," exists. I refuse to overwrite this data!\nDo you want to overwrite it? Well, get up and go delete this file locally and next time I will! -3.4XP"))
      next()
      }
  ## if DNE then downloads the file
  download.file(
    url = data_sources$data_url[i],
    destfile = paste0(dir, "/", data_sources$abbrev[i] , ".", ftype)
 )

  if (paste0(data_sources$abbrev[i] , ".", ftype) %in% list.files(dir)){
    message("Huzzah! Data ",  paste0(data_sources$abbrev[i] , ".", ftype),
            " successfully downloaded.\n+5XP.")
  } else(message(data_sources$abbrev[i] , ".", ftype,
                  " not successfully downloaded to desired location. Good luck. \n-5XP."))

} # end for loop: download data

cat("Side Quest download_data() complete!  +25XP")

} # END FUNCTION DEFINITION

