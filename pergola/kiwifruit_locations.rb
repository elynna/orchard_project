#!/usr/bin/env ruby

# Module for creating locations of kiwifruit (or flowers)

module Kiwifruit_locations
z_diff = 0.2
def getPose(number, x_max, y_max, z_mean)
	if number < 2
		anchors = 1
	else
		anchors = rand(1..((number/2).round))
	end
	fruit_locations_ = Array.new(number) { Array.new(3) }
	for i in (0, number*3).step(3)
		fruit_locations_[i][0] = rand(x_max)
		fruit_locations_[i][1] = rand(y_max)
		fruit_locations_[i][2] = z_mean+rand(-0.2,0.2)
	end
	return fruit_locations_

end
