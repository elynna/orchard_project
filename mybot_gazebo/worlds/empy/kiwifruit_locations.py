#!/usr/bin/env python

# This file contains the function used to get the randomised locations of fruit in the orchard. This is used by the em.py template.
import numpy as np
from random import randrange, uniform

def getFruitLocations(number, x_max, y_max, z_mean):
	z_diff = 0.2
	if number < 2:
		anchors = 1
	else:
		anchors = randrange(0,number/2)
	frand = uniform(0,10)
	fruit_locations_ = np.zeros((number, 3))
	for i in np.arange(0, number*3, 3):
		np.put(fruit_locations_, [i, i+1, i+2], [uniform(0,x_max), uniform(0,y_max), z_mean+uniform(-0.2,0.2)])
	return fruit_locations_
