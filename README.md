# USAvian  [![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges)

Leveraging knowledge, experience, data, and tools to decision making in the bird conservation and management community.


## About
This project was born from unsuccessful attempts of trying to build mental maps of who, what, where, and how various organizations, research groups, working groups, and state and federal agencies are doing conservtion science or delivery. We are designing a database of sorts to inform an interactive info-scape and companion user interface for digitally mapping out the complex network that is bird conservation. 

<img style="float: left;" src="/images/cdi_concept_img.png">

## Expected Benefits
__Connecting Science and Decision Makers__. Many researchers are producing science which is relevant, and in some cases can directly inform, avian conservation or management. However, unless the researcher is (a) funded by the relevant stakeholder(s) or (b) is hyperaware of the potential stakeholders, their science may not be consumed by stakeholders until they come across the published science. Even if the consumer finds this published research, they must then digest and translate the science published. This project has the potential to serve as a middle-person. That is, a researcher who is interested in efficiently disseminating their work might identify potential stakeholders based on taxonomic, spatial, or temporal attributes in the database. 

__Networking__. Although most conservation groups are likely aware of those doing conservation or management work either in similar regions of the US, or are working with similar habitat or taxa, this tool may help users identify previously unknown entities who are perhaps working with similar taxa but in disparate areas, or in similar areas but with disparate taxa. This tool may help reduce the siloed divisions within the [bird] conservation community. 

__Outreach__. Similar to its role in teaching, the tool may also help increase awareness outside the scientific communities of the conseravtion efforts in their immediate area, or with respect to taxa of interest. We also envision this map to as a resource to which communication professionals can refer when researching conservation news per region or species.

## Iterative Design and Development of the User Interface
<img style="float: left;" src="/images/usability_concept.png">

## Desired Features
For updated lists of potential and acutal data sources, please visit Issues [2](https://github.com/TrashBirdEcology/USAvian/issues/2), [3](https://github.com/TrashBirdEcology/USAvian/issues/3),  and [7](https://github.com/TrashBirdEcology/USAvian/issues/7). 

## Contributions
If you'd like to help or voice your strongly-worded opinion publicly, please visit [Issue 1](https://github.com/TrashBirdEcology/USAvian/issues/1) or [email JLB](mailto:jessicaleighburnett@gmail.com). Contributors must follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Core Team
- Jessica Burnett ([GH:trashbirdecology](https://github.com/trashbirdecology))
- Kevin Burgio ([GH:krburgio](https://github.com/rburgio))
- Auriel Fournier ([GH:aurielfournier](https://github.com/aurielfournier))
- Brian Wee ([GH:brianwee](https://github.com/brianwee))


<!---
## Repository Structure
```
├── README.md                  : Description of this repository
├── LICENSE                    : Repository license
├── CODE_OF_CONDUCT.md         : Code of conduct for the repository
├── man                        : Package documentation (.rd files)
├── paper                      : Manuscript associated with the software
├── vignettes                  : Vignettes providing overviews of the package functionality
├── R                          : Source code for package functions and data descriptions
├── data                       : Package data (.rda) and information relevant to munging various data sources
│   ├── US_IBAs.zip            : Audubon's Important Bird Areas (usage restrictions; contact Audubon to request use)
│   ├── data_sources.csv       : Source data for creating the package data "data_sources". Created by JLB. 
│   ├── data_sources.rda       : R data comprising the links and various user-defined information on data sources used to build the package
│   ├── spatial_data_types.txt : Source data for creating package data "spatial_data_types". Created by JLB. 
│   ├── spatial_data_types.rda : R data comprising self-categorized information about various spatial data filetypes. Used in package for "guessing" how to import the spatial data into R environment
```
 │       ├──               : --->


## USGS Provisional Software
This software is preliminary or provisional and is subject to revision. It is being provided to meet the need for timely best science. The software has not received final approval by the U.S. Geological Survey (USGS). No warranty, expressed or implied, is made by the USGS or the U.S. Government as to the functionality of the software and related material nor shall the fact of release constitute any such warranty. The software is provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the software.
