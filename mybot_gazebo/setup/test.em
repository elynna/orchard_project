#! This is the description for test.em Author: eyan323
#! This is testing the posts in rows

@{import em}@

@{from numpy import arange}
@{post_count = 0}
@[for side in ['left','right']]
	@[if side == 'left']
		@{y = -1.5}
		@{yaw = 3.1415}
	@[else]
		@{y = 1.5}
		@{yaw = 0}
	@[end if]
	@[for x in arange(-1.5, 1.5, 0.5)]
		<include>
			<name>post_@(post_count)</name>
			<pose>@(x) @(y) 0.5 0 0 @(yaw)</pose>
			<uri>model://post</uri>
		</include>
		<model name="post_@(post_count)">
			<static>true</static>
			<pose>@(x) @(y*1.125) 0.63 0 0 @(yaw)</pose>
			<link name="link">
				<visual name="visual">
					<geometry><cylinder><size>.1 .1 1.75</size></cylinder></geometry>				
					<material>
						<script>
							<uri>model://bin/tags</uri>
							<name>product_@(post_count)</name>
						</script>
					</material>
				</visual>
			</link>
		</model>	
		@{post_count += 1}
	@[end for]
@[end for]
