# USAvian
An interactive map for connecting and visualizing the bird conservation and management networks in the U.S.  A collection of collections. A list of lists. A map of maps. The one-stop shop for entities directly or indirectly doing bird conservation and management.


## About
This project was born from unsuccessful attempts at trying to build mental maps of what groups, cooperatives, federal agencies are "doing" or proposing bird conservation. We will design a database to inform a visualization (map) of this network. 

The database will be interoperable with the USGS Biogeographic Information System, which can then be easily incorporated into the visualization scheme used under this system (e.g. see visualizations at [maps.usgs.gov](maps.usgs.gov) for  examples). 

## Expected Benefits
__Connecting Science and Decision Makers__. Many researchers are producing science which is relevant, and in some cases can directly inform, avian conservation or management. However, unless the researcher is (a) funded by the relevant stakeholder(s) or (b) is hyperaware of the potential stakeholders, their science may not be consumed by stakeholders until they come across the published science. Even if the consumer finds this published research, they must then digest and translate the science published. This project has the potential to serve as a middle-person. That is, a researcher who is interested in efficiently disseminating their work might identify potential stakeholders based on taxonomic, spatial, or temporal attributes in the database. 

__Networking__. Although most conservation groups are likely aware of those doing conservation or management work either in similar regions of the US, or are working with similar habitat or taxa, this tool may help users identify previously unknown entities who are perhaps working with similar taxa but in disparate areas, or in similar areas but with disparate taxa. 

__Teaching__. This tool can be used to help understand the roles which various organizations and agencies play in bird conservation, and at what spatial and temporal scales. 

__Outreach__. Similar to its role in teaching, the tool may also help increase awareness outside the scientific communities of the conseravtion efforts in their immediate area, or with respect to taxa of interest. 


## Desired Features
For updated lists of potentia and acutal data sources, please visit Issues [2](https://github.com/TrashBirdEcology/USAvian/issues/2), [3](https://github.com/TrashBirdEcology/USAvian/issues/3),  and [7](https://github.com/TrashBirdEcology/USAvian/issues/7). 


### Species ranges
Include layers for species ranges such that the user can identify relevant conservation or management persons/groups who woudld be good contacts in a specific area? 

Potential layers for species range maps include: 
1. [USGS GAP](https://www.usgs.gov/core-science-systems/science-analytics-and-synthesis/gap/science/species) (approximately 2,000 predicted distributions)
1. Birds of North America seasonal range maps (e.g. see BNA for [Ovenbird](https://www.allaboutbirds.org/guide/Ovenbird/maps-range); not sure if these map layers are retrievable, however)
1. [Bird Life International](). Species range map .shps for X species?


### Agencies, collaboratives, etc. doing conservation
Include publicly available contact information for the groups doing conservation at certain species x spatial scales. Ideally, this database of 'doers' would be dynamic, such that users could add and/or edit the underlying database via a form or through pull requests. 

1. Local audubon societies
1. Federal agencies (lands, conservation zones)
1. State agencies
1. NGOs


### Dynamic updating
As mentioned in the previous section, the map might include a mechanism by which end users could contribute or update information. Ideally, these changes would be pushed to the application once reviewed by a moderator, rather than having to rely on the developer to re-build the application each time a change is implemented. 

### Linking DOIs to spatial and/or taxonomic features of the database/map
Should the tool include a user-defined list of published science which is relevant to bird conservation and/or management, we could include a feature which allows persons to link DOIs to geographic or political boundaries, or to species at various taxonomic levels.  


## Contributions
If you'd like to help or voice your strongly-worded opinion publicly, please visit [Issue 1](https://github.com/TrashBirdEcology/USAvian/issues/1) or [email JLB](mailto:jessicaleighburnett@gmail.com). Contributors must follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Project Team
- Kevin Burgio ([krburgio](https://github.com/rburgio))
- Jessica Burnett ([trashbirdecology](https://github.com/trashbirdecology))
- Auriel Fournier ([aurielfournier](https://github.com/aurielfournier))

## Repository Structure
```
├── README.md                  : Description of this repository
├── LICENSE                    : Repository license
├── CODE_OF_CONDUCT.md         : Code of conduct for the repository
│
│
├── data                       : Data files used to build and/or produce layers associated with the interactive map
│   ├── shapefiles
│       ├──  birds             : Shapefiles containing species range maps, predictions from species distribution models,
│                                  and occurrence data
│       ├──  conservation_units: Shapefiles containing boundaries of conservation units (e.g. FWS regions, managed state │      │                                  lands, TNC lands
│       ├──  geography         : Geographical and political (e.g. US States, CA regions) boundaries
│       ├──  cooperative_units : Shapefiles containing boundaries of collectives, cooperatives, groups of conservation units │                                  (e.g. GOMAMN)
│
├── data                       : Data files used to build and/or produce layers associated with the interactive map
│   ├── TBD

```


## USGS Provisional Software
This software is preliminary or provisional and is subject to revision. It is being provided to meet the need for timely best science. The software has not received final approval by the U.S. Geological Survey (USGS). No warranty, expressed or implied, is made by the USGS or the U.S. Government as to the functionality of the software and related material nor shall the fact of release constitute any such warranty. The software is provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the software.
