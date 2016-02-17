#! This is the description for test.em Author: eyan323
@{import em}@
@{import numpy as np}
@{from kiwifruit_locations import getLocations}
@{from numpy import arange}
<?xml version="1.0"?>
<sdf version="1.4">
<world name="mybot_world">
	<include> <uri>model://sun</uri> <pose>0 50 10 0 0 0</pose> </include>
	<include> <uri>model://orchard_ground_plane</uri> </include>
@{col_num = 10}
@{row_num = 10}
@{col_dist = 2.0}
@{row_dist = 1.0}
@{post_tree_dist = 0.2}
@{fruit_locations = getLocations()}
@[if col_num < 1]
	@{col_num = 1}
@[end if]
@[if row_num < 1]
	@{row_num = 1}
@[end if]
@[if col_dist < 1]
	@{col_dist = 1}
@[end if]
@[if row_dist < 0.5]
	@{row_dist = 0.5}
@[end if]
@{post_count = 0}
@[for x in arange (0, col_num*col_dist, col_dist)]
	@[for y in arange(0, row_num*row_dist, row_dist)]
		<include>
			<name>post_@(post_count)</name>
			<pose>@(x) @(y) 0.5 0 0 0</pose>
			<uri>model://post</uri>
		</include>	
		@{post_count += 1}
	@[end for]
@[end for]
@{tree_count = 0}
@[for x in arange (0, col_num*col_dist, col_dist)]
	@[for y in arange(0+post_tree_dist, row_num*row_dist, row_dist)]
		<include>
			<name>tree_@(tree_count)</name>
			<pose>@(x) @(y) 0.5 0 0 0</pose>
			<uri>model://tree_trunk</uri>
		</include>	
		@{tree_count += 1}
	@[end for]
@[end for]

@{fruit_count = 0}
@[for location in fruit_locations]
	<include>
		<name>fruit_@(fruit_count)</name>
		<pose>@(location[0]) @(location[1]) @(location[2]) 0 0 0</pose>
		<uri>model://fruit</uri>
	</include>	
	@{fruit_count += 1}
@[end for]

</world>
</sdf>
