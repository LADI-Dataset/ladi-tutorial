# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 18:08:46 2020

@author: zachr
"""



## Inputs either a N X 1 imagery UUID or an image itself


import pandas as pd
import csv
import numpy as np
from math import sqrt

## Calculate the distance, in units meters, between the latitude, longitude metadata of the image and all nearby airports

# Assign value to lat/long of image
#latimage = 0
#longimage = 0

# ref https://github.com/LADI-Dataset/ladi-tutorial/blob/master/script/setup.sh
df = pd.read_csv("Airports.csv")

# making data frame  
airport_long_deg = df['X'].values
airport_lat_deg = df['Y'].values
airport_name = df['NAME'].values
airport_global_id = df['GLOBAL_ID'].values

#print(type(longairport[0]))
#airportloc = np.array([longairport, latairport])

# make new column for distance to airports
def findclosestairport(input_lat_deg,input_long_deg):
    
    closest_index = 0
    closest_airport_distance = np.inf
    
    #for latimage, longimage in somelist:
    #latimage_list = []
    for idx in range(len(airport_long_deg)):
        curr_long = float(airport_long_deg[idx])
        curr_lat = float(airport_lat_deg[idx])
        
        curr_distance = get_distance_degrees(curr_long, curr_lat, input_lat_deg, input_long_deg)
        
        if curr_distance < closest_airport_distance:
            closest_airport_distance = curr_distance
            closest_index = idx
            
    distance_meters = closest_airport_distance * 111194.926644559
            
    return [distance_meters, airport_long_deg[closest_index], airport_lat_deg[closest_index], airport_name[closest_index], airport_global_id[closest_index]]
        
        


def get_distance_degrees(long, lat, input_lat_deg, input_long_deg):
    return sqrt((abs(input_lat_deg - lat))**2 + (abs(input_long_deg - long))**2)

# input long,lat, output closest airport info
print(findclosestairport(42.373615, -71.109734))
    


