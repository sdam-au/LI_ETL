# LIRE

---
## Authors
* Vojtech Kase [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](http://orcid.org/0000-0002-6601-1605), Social Dynamics in the Ancient Mediterranean project, Aarhus University, vojtech.kase@gmail.com
* Petra Hermankova [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-6349-0540), Social Dynamics in the Ancient Mediterranean project, Aarhus University 
* Adela Sobotkova [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-4541-3963), Social Dynamics in the Ancient Mediterranean project, Aarhus University
## Description

**LIRE** dataset is an aggregate of EDH and EDCS epigraphic datasets. For inscriptions which are covered by both datasets, it contains attributes from both of them. In cases in which an inscription is available only in one dataset, it contains attributes only from that one dataset. Some crucial attributes are shared by both datasets:
* `clean_text_interpretive_word`: text of the inscription
* `not_before`: start of the dating interval
* `not_after` : end of the dating interval
* `geography` : latitude/longitude defining geospatial position in form of a point
In the case of other metadata attributes, the information cannot be easily transferred between the two sources. For instance, EDCS has the attribute `inscr_type` which should bear approximately the same information as `type_of_inscription_clean` in EDH. However, the `inscr_type` attribute from EDCS uses a different classification system than EDH, relies on latin labels of inscription types etc. We are currently working on a machine learning solution to this probalm of incompatible classifications.

A full, unfiltered, version of the dataset is currently available as a JSON file in a public folder on sciencedata.dk:
* URL for downlosd: https://sciencedata.dk/public/a9237c5ea642d4714bcdefb03f70a1f4/LIRE_unfiltered.json
* sddk command to read it into Python as Pandas DataFrame object: `LIRE = sddk.read_file("LIRE_unfiltered.geojson", "df", "a9237c5ea642d4714bcdefb03f70a1f4")`

A subset of the full dataset, which contains only inscriptions which are in Latin, which are geolocated, which are geolocated within the borders of the Roman Empire and which are dated to the period from 50 BC to 350 AD, is available in the same public folder as a GeoJSON file:
* URL for download: https://sciencedata.dk/public/a9237c5ea642d4714bcdefb03f70a1f4/LIREg.geojson
* sddk command to read it into Python as GeoPandas GeoDataFrame object: `LIREg = sddk.read_file("LIREg.geojson", "gdf", "a9237c5ea642d4714bcdefb03f70a1f4")`



### Data
[EDCS](http://www.manfredclauss.de/) dataset is accessed and transformed by the series of Python and R scripts in [EDCS ETL repository](https://github.com/sdam-au/EDCS_ETL), created by SDAM project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk or at this link: TBA in January [EDCS_public folder](https://sciencedata.dk/shared/1f5f56d09903fe259c0906add8b3a55e). 

[EDH]() dataset is accessed and transformed by the series of Python and R scripts in [EDH ETL repository](https://github.com/sdam-au/EDH_ETL) and in [EDH exploration repository](https://github.com/sdam-au/EDH_exploration), created by SDAM Project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk or at this link: [EDH_public folder](https://sciencedata.dk/shared/b6b6afdb969d378b70929e86e58ad975)

### Software
* Python 3
* Jupyter notebooks app/JupyterLab/JupyterHub
* Python 3 additional libraries listed `requirements.txt`

