# Clean and Validate LADI Dataset

- [Clean and Validate LADI Dataset](#clean-and-validate-ladi-dataset)
  - [Clean the aggregated Responses .tsv file](#clean-the-aggregated-responses-tsv-file)
  - [Generate True/False label](#generate-truefalse-label)
  - [Distribution Statement](#distribution-statement)

## Clean the aggregated Responses .tsv file

For our first approach, we will use human generated labels as the most accurate feature to represent each image. Our goal is to clean and validate the LADI dataset so that we can use them to train our image classification model. 

The image url can have multiple labels associated to it. Therefore, for workers that gave multiple labels in answer, you should seperate each of the labels withint the answer. The single response shows all the labels that one worker gave withint a single category.

Human generated labels cover 20% of the total images in the dataset. 

1. Download human generated label dataset into local environment and export the dataset into Cloud environment.

   ```python
   import pandas as pd
   import numpy as np
   human_label = "/content/drive/My Drive/Colab Notebooks/DS440_data/ladi_aggregated_responses_url.tsv"
   file = pd.read_csv(human_label,delimiter='\t',header='infer')
   ```

- Data information: 

- The LADI aggregated responses:

  - Provides human annotations of images in the LADI FEMA_CAP dataset. Each image might contain multiple annotations from different workers.

- Data points: 193663 rows

- Fields: 

  - *url* 
  - *WorkerId*
  - *Answer* Dataset contains 495 categories

- Answer outputs are similar to the following: 


  ![img](https://github.com/NaeRong/DS440_Capstone/blob/master/Images/Label_Human.png)

For this project, we will only consider 'damage' and 'infrastructure' labels.

2. Strip off bracket and comma from the Answer catagory

   ```python
   file["Answer"] = file["Answer"].str.strip('[|]')
   file["Answer"] = file["Answer"].str.split(",",expand = True)
   ```
3. Extract labels with damage and infrastructure categories

   ```python
   label_damage_infra = file[file['Answer'].str.contains('damage|infrastructure',na=False,case=False)]
   ```
4. Filter out infrastructure label with label 'none'
   ```python
   label_clean = label_damage_infra[~label_damage_infra['Answer'].str.contains('none',na=False,case=False)]
   ```
5. Extract data with label does contain 'flood'
   ```python
   label_flood = label_clean[label_clean['Answer'].str.contains('flood',na=False,case=False)]
   ```
6. Extract url data with the label does contain 'flood'
   ```python
   im_flood_lst = label_flood['url'].unique().tolist()
   ```
7. Extract url data with the label does not contain 'flood'
   ```python
   label_notflood = label_damage_infra[~label_damage_infra['img_url'].isin(im_flood_lst)]
   im_not_flood_lst = label_notflood['url'].unique().tolist()
   ``` 
8*. (Optional) Write list into csv file

   ```python
   def write_list_to_file(input_list, filename):
    with open(filename, "w") as outfile:
        for entries in input_list:
            outfile.write(entries)
            outfile.write("\n")
   ```   

## Generate True/False label 

1. Load ladi_images_metadata.csv
```python
metadata = pd.read_csv('/content/drive/My Drive/Colab Notebooks/ladi_images_metadata.csv')
```
2. Generate flood and non-flood metadata
```python
flood_metadata = metadata[metadata['url'].isin(im_flood_lst)]
not_flood_metadata = metadata[metadata['url'].isin(im_not_flood_lst)]
```
3. Generate url and s3_path features into list
```python
flood_meta_lst = flood_metadata['url'].tolist()
flood_meta_s3_lst = flood_metadata['s3_path'].tolist()

not_flood_meta_lst = not_flood_metadata['url'].tolist()
not_flood_meta_s3_lst = not_flood_metadata['s3_path'].tolist()
```
4. Check how many images do not have metadata but have human labels
```python
human_label_only = list(set(im_flood_lst) - set(flood_meta_lst))
print(len(human_label_only))
human_label_non_flood = list(set(im_not_flood_lst) - set(not_flood_meta_lst))
print(len(human_label_non_flood))
```
5*.(Optional) Generate small image datasets for modeling purpose : flood_tiny_metadata.csv and flood_tiny_label.csv
```python
from random import sample
flood_tiny_lst = sample(flood_meta_s3_lst, 100)
not_flood_tiny_lst = sample(not_flood_meta_s3_lst, 100)
flood_tiny_metadata = metadata[metadata['s3_path'].isin(flood_tiny_lst+not_flood_tiny_lst)]

flood_data = []
for path in flood_tiny_lst:
    data_lst = []
    data_lst.append(path)
    data_lst.append(True)
    flood_data.append(data_lst)

not_flood_data = []
for path in not_flood_tiny_lst:
    data_lst = []
    data_lst.append(path)
    data_lst.append(False)
    not_flood_data.append(data_lst)

label_data = flood_data+not_flood_data
label_df = pd.DataFrame(label_data, columns = ['s3_path', 'label']) 
#.to_csv('path')
flood_tiny_metadata.to_csv('/content/drive/My Drive/Colab Notebooks/DS440_data/flood_tiny_metadata.csv')
label_df.to_csv('/content/drive/My Drive/Colab Notebooks/DS440_data/flood_tiny_label.csv')
```

## Distribution Statement

[BSD -Clause License](https://github.com/LADI-Dataset/ladi-tutorial/blob/master/LICENSE)
