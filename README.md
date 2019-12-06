# USAvian
A relational database and companion user interface for visualizing the spatial distribution of bird conservation and management in the United States. A collection of collections. A list of lists. A map of maps. A one-stop shop for entities directly or indirectly doing bird conservation and management.


## About
Out of frustration of trying to build mental maps of what groups, cooperatives, federal agencies are "doing" bird conservation, I'd like to compile as comprehensive of a list as possible. Should the list become interesting enough, I envision some sort of [interactive map](https://maphub.net/), or a [story map](https://lccnetwork.org/resource/lcc-network-story-map) comprising these entities, which can be subsetted or filtered at various scales, or via other characteristics. Further, the visualization service might also include direct links to conservation initiatives or papertrails, management outcomes, or relevant research articles. 

## Potential Benefits
__Connecting Science and Decision Makers__. Many researchers are producing science which is relevant, and in some cases can directly inform, avian conservation or management. However, unless the researcher is (a) funded by the relevant stakeholder(s) or (b) is hyperaware of the potential stakeholders, their science may not be consumed by stakeholders until they come across the published science. Even if the consumer finds this published research, they must then digest and translate the science published. This project has the potential to serve as a middle-person. That is, a researcher who is interested in efficiently disseminating their work might identify potential stakeholders based on taxonomic, spatial, or temporal attributes in the database. 

__Networking__. Although most conservation groups are likely aware of those doing conservation or management work either in similar regions of the US, or are working with similar habitat or taxa, this tool may help users identify previously unknown entities who are perhaps working with similar taxa but in disparate areas, or in similar areas but with disparate taxa. 

__Outreach__. Similar to the potential role this tool might play in teaching, the tool may also help increase awareness outside the scientific communities of the conseravtion efforts in their immediate area, or with respect to taxa of interest. 

__Teaching__. This tool can be used to help understand the roles which various organizations and agencies play in bird conservation, and at what spatial scales. 


## Desired Features
### Species ranges
Include layers for species ranges such that the user can identify relevant conservation or management persons/groups who woudld be good contacts in a specific area? 

Potential layers for species range maps include: 
1. [USGS GAP](https://www.usgs.gov/core-science-systems/science-analytics-and-synthesis/gap/science/species) (approximately 2,000 predicted distributions)
1. Birds of North America seasonal range maps (e.g. see BNA for [Ovenbird](https://www.allaboutbirds.org/guide/Ovenbird/maps-range); not sure if these map layers are retrievable, however)
1. [Bird Life International](). Species range map .shps for X species?


### Agencies, collaboratives, etc. doing conservation
Include publicly available contact information for the groups doing conservation at certain species x spatial scales. Ideally, this database of 'doers' would be dynamic, such that users could add and/or edit the underlying database via a form or through pull requests. 

### Dynamic updating
As mentioned in the previous section, the map might include a mechanism by which end users could contribute or update information. Ideally, these changes would be pushed to the application once reviewed by a moderator, rather than having to rely on the developer to re-build the application each time a change is implemented. 

### Linking DOIs to spatial and/or taxonomic features of the database/map
Should the tool include a user-defined list of published science which is relevant to bird conservation and/or management, we could include a feature which allows persons to link DOIs to geographic or political boundaries, or to species at various taxonomic levels.  


## Contributions
If you'd like to help or voice your strongly-worded opinion publicly, please visit [Issue 1](https://github.com/TrashBirdEcology/USAvian/issues/1) or [email JLB](mailto:jessicaleighburnett@gmail.com). Contributors must follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Project Team
- Jessica Burnett
- Kevin Burgio


### Potential collaborators
- [Dr. Ryan](http://www.sadieryan.net/) teaches GIS courses and might be interested in using this project as a teaching module where students have deliverable objectives
- Abby Benson (USGS) - runs GBIF
- Sky Bristol - big picture big thinker 
- 

