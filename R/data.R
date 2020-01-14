# Description of the data stored in package as .Rda files.

#' Data Sources: Descriptions, Download Links, etc.
#'
#' A data frame containing the data sources used in the pilot tool, USAvian
#'
#' @format A data frame with YY variables
#' \describe{
#'   \item{}{}
#'   \item{}{}
#'   \item{}{}
#'   \item{}{}
#' }
#' @source \url{https://github.com/TrashBirdEcology/USAvian/blob/master/data/data_sources.csv}
"data_sources"

# data_sources<-read.csv("https://github.com/TrashBirdEcology/USAvian/blob/master/data/data_sources.csv", stringsAsFactors = FALSE)
## OR ##
# data_sources<-read.csv(here("data/data_sources.csv"), stringsAsFactors = FALSE)

# Save as RDA
saveRDS(data_sources, file=here("data/data_sources.Rda"))
