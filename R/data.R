# Description of the data stored in package USAvian (/data/)

#' Data Sources: Descriptions, Download Links, etc.
#'
#' A data frame containing the data sources used in the pilot tool, USAvian
#'
#' @format A data frame with YY variables
#' \describe{
#'   \item{title}{Name of the dataset.}
#'   \item{abbrev}{Abbreviation used for file accessing for each dataset. Data with multiple versions (e.g. BCR v10.0) are designated using data_vXX (e.g., BCR_v10).}
#'   \item{description}{A brief description of the data.}
#'   \item{file_type}{Type of file(s)}
#'   \item{data_url}{}
#'   \item{license}{License name (DNE=does not exist)}
#'   \item{data_usage}{Categorical. Team-imposed categories to describe the license level (e.g, CC0==open) }
#'   \item{refresh_rate_mos}{Frequency of data updating, unit=months)}
#'   \item{primary_curator}{Institution hosting or curating the data. Otherwise the primary contact organization to learn more about the data.}
#'   \item{context}{Categorical. Team-imposed categories to describe the type of data.(administrative_region=top-down decision making influencing on-ground decisions with authority; advisory_region=top-down advisory councils, not necessarily on-ground actions influenced by decisions; managed_lands=actively managed or conserved property; integrated_data=heterogeneous data sources, multiple sources).}
#'   \item{spat_extent}{Spatial extent of the information.}
#'   \item{spat_resolution}{Spatial resolution of the information}
#'   \item{temporal_extent}{Temporal extent of the information}
#'   \item{temporal_resolution}{Temporal resolution of the information}
#'   \item{in_padus}{Logical. Is the data in PAD-US (USGS Protected Areas Database)?}
#'   \item{in_sfr}{Logical. Is the data in SFR (USGS Spatial Features Registry)}
#'   \item{notes}{Team notes and relevant information}
#'   \item{high_level_url}{URL to learn more about the dataset and/or organization(s).}
#' }
#' @source \url{https://github.com/TrashBirdEcology/USAvian/blob/master/data/data_sources.csv}
"data_sources"
# Update data_sources data frame on package build
  ## this assumes the local version of data_sources.csv is UTD. make sure you pull before updating .Rda
  data_sources<-read.csv("data/data_sources.csv", stringsAsFactors = FALSE)
  usethis::use_data(data_sources, overwrite=TRUE)


# Spatial data type descriptions table ------------------------------------
#' Spatial Data Descriptions
#' A data frame containing user-defined descriptions of spatial file types, extensions, dependencies, etc.
#'
#' @format A data frame with YY variables
#' \describe{
#'   \item{geo_data_type}{Type of database or spatial data}
#'   \item{name}{Name of source data type}
#'   \item{description_high}{A high-level description of the data. Simple. Short.}
#'   \item{description_low}{A low-level, finer description of the file extension type}
#'   \item{ext_primary}{Primary associated extension. E.g, Shapefiles have many file extensions but are primarily associated with '.shp.' extensions.}
#'   \item{required}{Is the ext_primary required (TRUE), FALSE if an optional filetype.}
#'   \item{native_to}{Language or software to which the extension is native. Does not imply this extension can only be used in this software.}
#'   \item{default_xy}{Default coordinate reference system}
#'   \item{default_alt}{Default vertical reference system (altitude)}
#' }
#' @source \url{https://github.com/TrashBirdEcology/USAvian/blob/master/data/spatial_data_types.txt}
"spatial_data_types"
spatial_data_types<-read.table("data/spatial_data_types.txt", sep="\t", skip=1, header=TRUE)
usethis::use_data(spatial_data_types, overwrite=TRUE)


