# EDHCS

---
## Authors
* Vojtech Kase [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](http://orcid.org/0000-0002-6601-1605), Social Dynamics in the Ancient Mediterranean project, Aarhus University
* Petra Hermankova [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-6349-0540), Social Dynamics in the Ancient Mediterranean project, Aarhus University, petra.hermankova@cas.au.dk
* Adela Sobotkova [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-4541-3963), Social Dynamics in the Ancient Mediterranean project, Aarhus University
## Description

**EDHCS** dataset is an aggregate of EDH and EDCS epigraphic datasets. For inscriptions which are covered by both datasets, it contains attributes from both of them. In cases in which an inscription is available only in one dataset, it contains attributes only from that one dataset. Some crucial attributes are shared by both datasets:
* `clean_text_interpretive_word`: text of the inscription
* `not_before`: start of the dating interval
* `not_after` : end of the dating interval
* `geography` : latitude/longitude defining geospatial position in form of a point
In the case of other metadata attributes, the information cannot be easily transferred between the two sources. For instance, EDCS has the attribute `inscr_type` which should bear approximately the same information as `type_of_inscription_clean` in EDH. However, the `inscr_type` attribute from EDCS uses a different classification system than EDH, relies on latin labels of inscription types etc. We are currently working on a machine learning solution to this probalm of incompatible classifications.

A full, unfiltered, version of the dataset is currently available as a JSON file in a public folder on sciencedata.dk:
* URL for downlosd: https://sciencedata.dk/public/a9237c5ea642d4714bcdefb03f70a1f4/EDHCS_unfiltered.json
* sddk command to read it into Python as Pandas DataFrame object: `EDHCS = sddk.read_file("EDHCS_unfiltered.geojson", "df", "a9237c5ea642d4714bcdefb03f70a1f4")`

A subset of the full dataset, which contains only inscriptions which are in Latin, which are geolocated, which are geolocated within the borders of the Roman Empire and which are dated to the period from 50 BC to 350 AD, is available in the same public folder as a GeoJSON file:
* URL for download: https://sciencedata.dk/public/a9237c5ea642d4714bcdefb03f70a1f4/EDHCSg.geojson
* sddk command to read it into Python as GeoPandas GeoDataFrame object: `EDHCSg = sddk.read_file("EDHCSg.geojson", "gdf", "a9237c5ea642d4714bcdefb03f70a1f4")`


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

---
## Automatic assigment of `type_of_inscription`

The EDHCS dataset consists of 137,305 inscriptions. These inscriptions might be classified as falling into certain inscription categories. However, the two source datasets (EDH and EDCS) employ a different approach to inscription classification. First of all, EDH uses English labels (e.g. "epitaph", "votive inscription" etc.), while EDCS uses Latin labels (e.g. "tituli_sepulcrales" or "tituli sacri"). In some cases, these types can be matched upon each other in a straightforward manner, in other cases this is not so simple. For instance, since the typological categories employed by EDCS are not mutually exclusive, some inscriptions are classified by means of five different labels. Furthermore, one category in the first source might correspond to several categories within the second source. For instance, the `owner/artist inscription` category in EDH corresponds either to `tituli possessionis` and `tituli fabricationis` in EDCS.

Since we attempt to make the dataset as a whole accessible to cross-category comparisons, we had to decide which one of the two classification systems to employ. We decided for the EDH categories, especially because they are mutually exclusive, what makes the comparison slighthly more straitforward. 

However, since the EDH labels are present only for inscriptions included in the EDH dataset, we had to come up with a solution how top assign them to inscriptions from the EDCS dataset as well. This is a typical **document classification task**, which might be solved by numourous supervised machine learning methods. Here we decided for [Support Vector Machine (SVM)](https://en.wikipedia.org/wiki/Support-vector_machine) model to be trained on a subset of inscriptions which are included both in EDCS and EDH (for the whole implementation, see `scripts/3_INSCR-TYPE-AUTO.ipynb`). 

From the total number of 137,305 inscriptions in the EDHCS dataset, 49,916 are shared by both the EDH and EDCS dataset. From this subset, 46,171 are classified by means of the `type_of_inscription_clean` attribute  in EDH (the remaining 3,745 inscriptions are classified as `NULL`).  To build the SVM model, this constrained subset was divided into *training* and *test* datasets (90% were used to train and 10% (4,617) to test the model).

The aim was to use some attributes from EDCS to classify the EDCS inscriptions according to the EDH inscription categories (e.g. as "epitaph", "votive inscription" etc.). After some experimenting, we realized that we can use information from at least three different columns:
* `status_list`, including information about the inscription category according to EDCS combined with some other metadata
* `Material`, containing information about the material from which the inscription is built
* `clean_text_interpretive_word`, a preprocessed text of the inscription

These three columns were used to construct 157 features to feed a TFIDF vectorizer. The features were formed by 100 most common bigrams in the texts of the inscriptions (e.g. "Dis_Manibus", "vixit_annos" or "votum_solvit"). Further, 37 were based on all unqique categories within the attribute `status_list`. Finally, 20 features were based on 20 most common categories from the `Material` attribute (e.g. "lapis", "opus_figlinae", "aes"). (Underscore was used to treat multi-word features as one word features).


### Model Testing

For testing of the model we used 4,617 labeled inscriptions, randomly selected from 46,171 inscriptions contained both in EDH and EDCS, which have a non-empty `type_of_inscription_clean` attribute and which have not been used to  train the model. 

Each prediction of the SVM model is accompanied by **probability** on scale {0-1}, expressing a level of certainty concerning the predicted classification category. Thus, for instance, the inscription `EDCS-44500113` is classified as `votive inscription` with 0.919633 probability. On closer inscpection, we see that EDCS classifies this inscription as `tituli sacri`, what is probably the most important feature driving the prediction in this case.

These probabilities might be used to formulate certain thresholds under which the classification will not be accepted. In Table 1, we see that 90 % of inscriptions in the test dataset has been classified with probability equal to- or higher than 0.5 and that this classification was correct in 90 % of cases. Further, approximately 71 % of inscriptions has been classified  with probability equal to- or higher than 0.7. From these more than 95 % was classified correctly. These results can inform us when we apply the model upon an unlabled dataset, where we can expect a comparable ratios between threshold values, proportions of covered inscriptions and the extent of correct classifications.


|    |   threshold (=/>) |   proportion |    N |   correct |
|----|-------------------|--------------|------|-----------|
|  0 |              0.3  |         1    | 4601 |  0.862421 |
|  1 |              0.35 |         0.94 | 4337 |  0.890247 |
|  2 |              0.4  |         0.93 | 4310 |  0.8942   |
|  3 |              0.45 |         0.91 | 4213 |  0.898647 |
|  4 |              0.5  |         0.9  | 4162 |  0.90197  |
|  5 |              0.55 |         0.89 | 4092 |  0.90567  |
|  6 |              0.6  |         0.86 | 3955 |  0.908976 |
|  7 |              0.65 |         0.84 | 3898 |  0.910723 |
|  8 |              0.7  |         0.71 | 3264 |  0.957414 |
|  9 |              0.75 |         0.67 | 3078 |  0.968811 |
| 10 |              0.8  |         0.58 | 2694 |  0.971047 |
| 11 |              0.85 |         0.51 | 2336 |  0.977312 |
| 12 |              0.9  |         0.42 | 1957 |  0.984159 |
| 13 |              0.95 |         0.34 | 1563 |  0.989763 |

After testing, both the model and the vectorizer used to preprocess the data were saved as pickles for future reuse as `data/svm_model_v1.0.sav` and `data/svm_vectorizer_v1.0.sav`. 

### Model application

After training and testing the model on labeled data, we proceeded to apply the model on 83,482 inscriptions which are exclusively in EDCS. In this case, we cannot directly measure the proportion of correctly classified inscriptions. But we can use the data from testing to make an estimate.

|    |   threshold (=/>) |   proportion |     N |
|----|-------------------|--------------|-------|
|  0 |              0.3  |         0.99 | 82791 |
|  1 |              0.35 |         0.98 | 81618 |
|  2 |              0.4  |         0.97 | 81048 |
|  3 |              0.45 |         0.95 | 79585 |
|  4 |              0.5  |         0.95 | 78929 |
|  5 |              0.55 |         0.94 | 78289 |
|  6 |              0.6  |         0.93 | 77384 |
|  7 |              0.65 |         0.92 | 76863 |
|  8 |              0.7  |         0.73 | 61115 |
|  9 |              0.75 |         0.71 | 59070 |
| 10 |              0.8  |         0.61 | 50587 |
| 11 |              0.85 |         0.56 | 46450 |
| 12 |              0.9  |         0.49 | 40601 |
| 13 |              0.95 |         0.43 | 36118 |


As a result of applying the model, we enriched the whole EDHCS dataset by 2 new attributes:
* `type_of_inscription_auto`, containing either the predicted label or - where available - the label from `type_of_inscription_clean` 
* `type_of_inscription_auto_prob`, expressing the probability on the scale from 0 to 1 (1 is used for datapoints where the `type_of_inscription_clean` was used)

When we look at the dataset as a whole, we see that from the 137,305 inscriptions, 127,773 (93 %) are classified in `type_of_inscription_auto` with probability equal to- or higher than 0.55. Using the 0.55 threshold, this proportion of the dataset can be used for further comparisons.


