#! This is the description for test.em Author: eyan323
@{import em}@
@{import numpy as np}
@{from branch_locations import getBranchLocations}
@{from kiwifruit_locations import getFruitLocations}
@{crossbeam_length = 2}
@{post_height = 1.8}
@{wire_length = 0.5}
@{trunk_height = 1.8}
@{col_num = 4}
@{row_num = 6}
@{col_dist = 2.0}
@{row_dist = 1.0}
@{post_tree_dist = 0.2}
@# The number of wires between posts
@{wire_num = 3}
@{fruit_num = 50}
@{fruit_mean_z = 1.75}
@{fruit_locations = getFruitLocations(fruit_num, (col_num-1)*col_dist, (row_num-1)*row_dist, fruit_mean_z)}
<?xml version="1.0"?>
<sdf version="1.4">
<world name="mybot_world">
	<include> <uri>model://sun</uri> <pose>0 50 10 0 0 0</pose> </include>
	<include> <uri>model://orchard_ground_plane</uri> </include>
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
@[for x in np.arange (0, col_num*col_dist, col_dist)]
	@[for y in np.arange(0, row_num*row_dist, row_dist)]
		<include>
			<name>post_@(post_count)</name>
			<pose>@(x) @(y) 0 0 0 0</pose>
			<uri>model://post</uri>
		</include>	
		@{post_count += 1}
	@[end for]
@[end for]

@{crossbeam_count = 0}
@[for x in np.arange (0, (col_num-1)*col_dist, col_dist)]
	@[for y in np.arange(0, row_num*row_dist, row_dist)]
		<include>
			<name>crossbeam_@(crossbeam_count)</name>
			<pose>@(x+(crossbeam_length/2)) @(y) @(post_height) 0 0 0</pose>
			<uri>model://crossbeam</uri>
		</include>	
		@{crossbeam_count += 1}
	@[end for]
@[end for]

@{wire_count = 0}
@[for x in np.arange (0, (col_num-1)*col_dist+0.00000001, col_dist/wire_num)]
	@[for y in np.arange(0+(wire_length/2), (row_num-1)*row_dist+(wire_length/2), wire_length)]
		<include>
			<name>wire_@(wire_count)</name>
			<pose>@(x) @(y) @(post_height) 1.570796 0 0</pose>
			<uri>model://wire</uri>
		</include>	
		@{wire_count += 1}
	@[end for]
@[end for]


@{tree_count = 0}
@[for x in np.arange (0, col_num*col_dist, col_dist)]
	@[for y in np.arange(0+post_tree_dist, row_num*row_dist, row_dist)]
		<include>
			<name>tree_@(tree_count)</name>
			<pose>@(x) @(y) 0 0 0 0</pose>
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
