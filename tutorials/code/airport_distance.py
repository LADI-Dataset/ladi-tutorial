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

# making data frame  
df = pd.read_csv("Airports.csv")
longairport = df['X'].values
latairport = df['Y'].values
nameairport = df['NAME'].values
idairport = df['GLOBAL_ID'].values

#print(type(longairport[0]))
#airportloc = np.array([longairport, latairport])

# make new column for distance to airports
def findclosestairport(latimage,longimage):
    
    closest_index = 0
    closest_distance = np.inf
    
    #for latimage, longimage in somelist:
    #latimage_list = []
    for idx in range(len(longairport)):
        curr_long = float(longairport[idx])
        curr_lat = float(latairport[idx])
        
        curr_distance = get_distance_degrees(curr_long, curr_lat, latimage, longimage)
        
        if curr_distance < closest_distance:
            closest_distance = curr_distance
            closest_index = idx
            
    distance_meters = closest_distance * 111194.926644559
            
    return [distance_meters, longairport[closest_index], latairport[closest_index], nameairport[closest_index], idairport[closest_index]]
        
        


def get_distance_degrees(long, lat, latimage, longimage):
    return sqrt((abs(latimage - lat))**2 + (abs(longimage - long))**2)

# input long,lat, output closest airport info
print(findclosestairport(42.373615, -71.109734))
    


