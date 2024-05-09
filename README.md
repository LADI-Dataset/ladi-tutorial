# LADI Tutorials

⚠️ These tutorials are for the deprecated version 1 of LADI. See the [LADI-v2 documentation](https://github.com/LADI-Dataset/ladi-overview) for more up-to-date information about how to start using LADI ⚠️

Tutorials for the Low Altitude Disaster Imagery (LADI) dataset. This tutorial was originally forked from a [Penn State Learning Factory](https://www.lf.psu.edu/) capstone project.

- [LADI Tutorials](#ladi-tutorials)
  - [Point of Contact](#point-of-contact)
  - [Initial Setup](#initial-setup)
    - [Persistent System Environment Variables](#persistent-system-environment-variables)
    - [Scripts](#scripts)
  - [Tutorials - Accessing the Dataset](#tutorials---accessing-the-dataset)
  - [Tutorials - Metadata Analysis](#tutorials---metadata-analysis)
    - [Tutorials - Machine Learning](#tutorials---machine-learning)
  - [Distribution Statement](#distribution-statement)

## Point of Contact

We encourage the use of the [GitHub Issues](https://guides.github.com/features/issues/) but when email is required, please contact the administrators at [ladi-dataset-admin@mit.edu](mailto:ladi-dataset-admin@mit.edu). As the public safety and computer vision communities adopt the dataset, a separate mailing list for development may be created.

## Initial Setup

This section specifies the run order and requirements for the initial setup the repository. Other repositories in this organization may be reliant upon this setup being completed.

### Persistent System Environment Variables

Immediately after cloning this repository, [create a persistent system environment](https://superuser.com/q/284342/44051) variable titled `LADI_DIR_TUTORIAL` with a value of the full path to this repository root directory.

On unix there are many ways to do this, here is an example using [`/etc/profile.d`](https://unix.stackexchange.com/a/117473). Create a new file `ladi-env.sh` using `sudo vi /etc/profile.d/ladi-env.sh` and add the command to set the variable:

```bash
export LADI_DIR_TUTORIAL=PATH TO /ladi-tutorial
```

You can confirm `LADI_DIR_TUTORIAL` was set in unix by inspecting the output of `env`.

### Scripts

This is a set of boilerplate scripts describing the [normalized script pattern that GitHub uses in its projects](https://github.blog/2015-06-30-scripts-to-rule-them-all/). The [GitHub Scripts To Rule Them All](https://github.com/github/scripts-to-rule-them-all) was used as a template. Refer to the [script directory README](./script/README.md) for more details.

You will need to run these scripts in this order to download package dependencies and download all of the necessary data to get you started.

## Tutorials - Accessing the Dataset

A set of tutorials focused on installing AWS tools and configuring AWS environment to download LADI dataset and load dataset in Python locally and remotely. There is also a short tutorial on how to clean and validate data.

- [Getting Started](./tutorials/Get_Started.md)
- [Clean and Validate LADI Dataset](./tutorials/Clean_Validate.md)

## Tutorials - Metadata Analysis

A set of tutorials that are Jupyter Python 3.X notebooks that demonstrate on how to perform geospatial analysis by enhancing the LADI metadata with third party GIS information. One tutorial identifies the number of images taken within an administrative boundary (e.g. USA states) and assigns each state a color based on the number of images taken. The other tutorial filters images based on an specific annotation and performs various geospatial measurements on this subset.

- [ISO-3166-2 Administrative Boundaries](./tutorials/Geospatial-Hurricane-Analysis.ipynb)
- [Geospatial Hurricane Analysis](./tutorials/Geospatial-Hurricane-Analysis.ipynb)

### Tutorials - Machine Learning

These tutorials focus on how to training and testing a classifier model using Convolutional Neural Network (CNN) from scratch or using pre-trained ResNet and AlexNet.

- [PyTorch Data Loading](./tutorials/Pytorch_Data_Load.md)
- [Train and Test A Classifier](./tutorials/Train_Test_Classifier.md)
- [Fine Tuning Torchvision Models](./tutorials/Fine_Tune_Torchvision_Models.md)

This documentation is about loading LADI dataset in PyTorch framework including examples of writing custom `Dataset`, `Transforms` and `Dataloader`.

## Citation

Please use this DOI number reference when citing the software:

[![DOI](https://zenodo.org/badge/263348174.svg)](https://zenodo.org/badge/latestdoi/263348174)

## Distribution Statement

[BSD 3-Clause License](LICENSE)
