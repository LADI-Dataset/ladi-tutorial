#!/bin/sh

# script/setup:
# Set up application for the first time after cloning, 
# or set it back to the initial first unused state.

###### DOWNLOAD FAA AIRPORTS
# https://ais-faa.opendata.arcgis.com/datasets/e747ab91a11045e8b3f8a3efd093d3b5_0
URL_AIRPORTS='https://opendata.arcgis.com/datasets/e747ab91a11045e8b3f8a3efd093d3b5_0.zip'

# Download file
wget $URL_AIRPORTS -O $FLOOD_ANALYSIS_CORE/data/FAA-Airports/faa_airports.zip

# unzip all files
unzip -j -o $FLOOD_ANALYSIS_CORE/data/FAA-Airports/faa_airports.zip -d $FLOOD_ANALYSIS_CORE/data/FAA-Airports/

###### DOWNLOAD US STATES
# https://catalog.data.gov/dataset/tiger-line-shapefile-2017-nation-u-s-current-state-and-equivalent-national
URL_STATES='https://www2.census.gov/geo/tiger/TIGER2017/STATE/tl_2017_us_state.zip'

# Download file
wget $URL_STATES -O $FLOOD_ANALYSIS_CORE/data/Census-State/tl_2017_us_state.zip

# unzip all files
unzip -j -o $FLOOD_ANALYSIS_CORE/data/Census-State/tl_2017_us_state.zip -d $FLOOD_ANALYSIS_CORE/data/Census-State/

###### DOWNLOAD CENSUS CBSA CODES
# https://catalog.data.gov/dataset/tiger-line-shapefile-2019-nation-u-s-current-metropolitan-statistical-area-micropolitan-statist
URL_CBSA='https://www2.census.gov/geo/tiger/TIGER2019/CBSA/tl_2019_us_cbsa.zip'

# Download file
wget $URL_CBSA -O $FLOOD_ANALYSIS_CORE/data/Census-CBSA/tl_2019_us_cbsa.zip

# unzip all files
unzip -j -o $FLOOD_ANALYSIS_CORE/data/Census-CBSA/tl_2019_us_cbsa.zip -d $FLOOD_ANALYSIS_CORE/data/Census-CBSA/


###### DOWNLOAD AHS DATA
# http://www2.census.gov/programs-surveys/ahs/2017/AHS%202017%20National%20PUF%20v3.0%20Flat%20CSV.zip?#
URL_AHS_DATA='http://www2.census.gov/programs-surveys/ahs/2017/AHS%202017%20National%20PUF%20v3.0%20Flat%20CSV.zip'

# Download file
wget $URL_AHS_DATA -O $FLOOD_ANALYSIS_CORE/data/Census-AHS/2017_ahs_national_puf.zip

# unzip all files
unzip -j -o $FLOOD_ANALYSIS_CORE/data/Census-AHS/2017_ahs_national_puf.zip -d $FLOOD_ANALYSIS_CORE/data/Census-AHS/
