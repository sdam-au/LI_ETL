# EDHCS

---
## Authors
* Vojtech Kase
* Petra Hermankova [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-6349-0540), SDAM project, petra.hermankova@cas.au.dk
* Adela Sobotkova

## Description

**EDHCS** dataset is an aggregate of EDH and EDCS epigraphic datasets. For inscriptions which are covered by both datasets, it contains attributes from both of them. In cases in which an inscription is available only in one dataset, it contains attributes only from that one dataset. Some crucial attributes are shared by both sources:
* `clean_text_interpretive_word`: text of the inscription
* `not_before`: start of the dating interval
* `not_after` : end of the dating interval
* `geography` : latitude/longitude defining geospatial position in form of a point
In the case of other metadata attrubutes, the information cannot be easily transferred between the two sources. For instance, EDCS has the attribute `inscr_type` which should bear approaximately the same information as `type_of_inscription_clean` in EDH. However, the `inscr_type` attribute from EDCS uses a different classification system than EDH, relies on latin labels of inscription types etc. We are currently working on a machine learning solution to this probalm of incompatible classifications.

---

## License

## DOI
[Here will be DOI or some other identifier once we have it]


---
## How to use this repository

* download or clone the repository
* activate the virtual environment (open your command line, move the the repository folder and run `bash ./create_socdiv_venv.sh`)
* in the jupyter notebooks, always check that you are connected to the *socdiv_venv* kernel
* (alternatively, if you do not wish to use the virtual environment, make sure that you have installed all required python packages within the `requirements.txt` file: `pip install -r requiremnts.txt`

### Data
[EDCS](http://www.manfredclauss.de/) dataset is accessed and transformed by the series of Python and R scripts in [EDCS ETL repository](https://github.com/sdam-au/EDCS_ETL), created by SDAM project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk or at this link: TBA in January [EDCS_public folder](https://sciencedata.dk/shared/1f5f56d09903fe259c0906add8b3a55e). 

[EDH]() dataset is accessed and transformed by the series of Python and R scripts in [EDH ETL repository](https://github.com/sdam-au/EDH_ETL) and in [EDH exploration repository](https://github.com/sdam-au/EDH_exploration), created by SDAM Project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk or at this link: [EDH_public folder](https://sciencedata.dk/shared/b6b6afdb969d378b70929e86e58ad975)

### Software
* Python 3
* Jupyter notebooks app/JupyterLab/JupyterHub
* Python 3 additional libraries listed `requirements.txt`


