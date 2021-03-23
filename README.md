# Measuring social development and diversity in ancient epigraphic production
*ANALYSIS* - work in progress, contents of this repository is likely change on a daily basis

---
## Authors
* Petra Hermankova [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-6349-0540), SDAM project, petra.hermankova@cas.au.dk
* Vojtech Kase
* Adela Sobotkova

## Abstract
Social development is often measured through increasing social stratification and economic specialisation through time. According to Adam Smith (1776/2007), growing population size leads to greater specialisation of labour as well as the proliferation of social roles. However true for modern society, this theory has been applied to the ancient world only to a limited extent (Bowman and Wilson 2009; Hanson, Ortman, and Lobo 2017), mostly due to the problematic access to comparable and relevant longitudinal datasets.

Inscriptions on permanent media have been produced by most communities of the ancient Meditteranean, providing a proxy for the population that created them. The texts of inscriptions mention not only the names of individuals, but also their occupation and craft and trade associations that we can locate in space and time. The number as well as the content of the inscriptions thus let us evaluate the relation between the degree of economic specialization and the estimated size of the urban population in ancient Mediterranean. 

Given that Smith's law operates on the density of population, we will test its core assumptions by comparing the variation in social and economic differentiation expressed in epigraphic monuments between rural and urban areas and in time. The expectation is that the social diversity in inscriptions will increase with higher population density (closer toward urban centers). 

This study contributes to the debate on the role of urbanism in ancient Mediterranean by using large-scale but highly granular data as proxies for economic and social development. The study aims to set an example by following FAIR data principles and best practices in reproducible open research.

---

## License
CC-BY-SA 4.0, see attached [License.md](https://github.com/sdam-au/EDCS_ETL/blob/master/LICENSE.md)

## DOI
[Here will be DOI or some other identifier once we have it]


---
## How to use this repository

* download or clone the repository
* activate the virtual environment (open your command line, move the the repository folder and run `bash ./create_pia_venv.sh`)
* in the jupyter notebooks, always check that you are connected to the *pia_venv* kernel
* (alternatively, if you do not wish to use the virtual environment, make sure that you have installed all required python packages within the `requirements.txt` file: `pip install -r requiremnts.txt`

### Data
[EDCS](http://www.manfredclauss.de/) dataset is accessed and transformed by the series of Python and R scripts in [EDCS ETL repository](https://github.com/sdam-au/EDCS_ETL), created by SDAM project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk or at this link: TBA in January [EDCS_public folder](https://sciencedata.dk/shared/1f5f56d09903fe259c0906add8b3a55e). 

[EDH]() dataset is accessed and transformed by the series of Python and R scripts in [EDH ETL repository](https://github.com/sdam-au/EDH_ETL) and in [EDH exploration repository](https://github.com/sdam-au/EDH_exploration), created by SDAM Project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk or at this link: [EDH_public folder](https://sciencedata.dk/shared/b6b6afdb969d378b70929e86e58ad975)

### Software
* Python 3
* Jupyter notebooks app/JupyterLab/JupyterHub
* Python 3 additional libraries listed `requirements.txt`






