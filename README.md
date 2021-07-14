# LIRE (Latin Inscriptions of the Roman Empire)

---
## Authors
* currently anonymized (related article under review)


## Description

This repository serves for creation, cleaning and enrichement od the **LIRE** dataset. The LIRE dataset is an aggregate of EDH and EDCS epigraphic datasets. From these sources, it includes only inscriptions which are (a) geolocated, (b) within the borders of the Roman Empire in its highest extent, (c) dated (d) in the dating interval intersecting the period from 50 BC to 350 AD. For inscriptions which are covered by both datasets, it contains attributes from both of them. In cases in which an inscription is available only in one dataset, it contains attributes only from that one dataset. Some crucial attributes are shared by both datasets:
* `clean_text_interpretive_word`: text of the inscription
* `not_before`: start of the dating interval
* `not_after` : end of the dating interval
* `geography` : latitude/longitude defining geospatial position in form of a point
In the case of other metadata attributes, the information cannot be easily transferred between the two sources. For instance, EDCS has the attribute `inscr_type` which should bear approximately the same information as `type_of_inscription_clean` in EDH. However, the `inscr_type` attribute from EDCS uses a different classification system than EDH, relies on latin labels of inscription types etc. This project overcomes this issue by developing and applying a machine learning classification model (see `scripts/CLASSIFIER_TRAINING&TESTING.ipynb` and `scripts/CLASSIFIER-APPLICATION.ipynb`). This way the dataset is enriched by two additional attributes: `type_of_inscription_auto` and `type_of_inscription_prob`.

The dataset consists of 137,305 records and 112 attributes. There are 49,916 inscriptions shared by the EDH and EDCS, inheriting attributes from both parent collections. Further, there are 3,907 inscriptions recorded exclusively in EDH and 83,482 inscriptions originating solely from EDCS. 

The final dataset is available via Zenodo:
* URL for download the final dataset: https://zenodo.org/record/5074774/files/LIREg.geojson?download=1  (to read it into Python as GeoPandas GeoDataFrame object, use `LIREg = gpd.read_file("https://zenodo.org/record/5074774/files/LIREg.geojson?download=1", driver="GeoJSON")`
* Metadata: `LIREg_Metadata.csv`


There is also an unfiltered version of the aggregated dataset, currently available as a JSON file in a public folder on sciencedata.dk:
* URL for download: https://sciencedata.dk/public/a9237c5ea642d4714bcdefb03f70a1f4/LIRE_unfiltered.json
* sddk command to read it into Python as Pandas DataFrame object: `LIRE = sddk.read_file("LIRE_unfiltered.geojson", "df", "a9237c5ea642d4714bcdefb03f70a1f4")`
* Metadata: `LIRE_unfiltered_Metadata.csv`


### Data
[EDCS](http://www.manfredclauss.de/) dataset is accessed and transformed by the series of Python and R scripts in [EDCS ETL repository](https://github.com/sdam-au/EDCS_ETL), created by the SDAM project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk  using the following url: https://sciencedata.dk/shared/1f5f56d09903fe259c0906add8b3a55e. 

[EDH]() dataset is accessed and transformed by the series of Python and R scripts in [EDH ETL repository](https://github.com/sdam-au/EDH_ETL) and in [EDH exploration repository](https://github.com/sdam-au/EDH_exploration), created by the SDAM Project. The latest version of the dataset (as JSON file) can be accessed via Sciencedata.dk using the following url: https://sciencedata.dk/shared/b6b6afdb969d378b70929e86e58ad975.

### Software
* Python 3
* Jupyter notebooks app/JupyterLab/JupyterHub
* Python 3 additional libraries listed `requirements.txt`

