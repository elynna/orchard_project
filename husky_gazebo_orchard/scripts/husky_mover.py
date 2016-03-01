#!/usr/bin/env python
#import roslib; roslib.load_manifest('robot_mover')
import rospy
import os
import math
import tf

from move_base_msgs.msg import MoveBaseActionGoal
from geometry_msgs.msg import PoseStamped

# This module will set 2 goals for the Clearpath Husky robot in the orchard demo.
# See the move_base package for how the robot is navigated to these goals.

def husky_mover():
    pub = rospy.Publisher('/move_base/goal', MoveBaseActionGoal, queue_size=0)
    rospy.init_node('husky_mover')

    myGoal = MoveBaseActionGoal()
    targetPos = PoseStamped()

    rospy.sleep(1)
    
    rospy.loginfo("Setting the robot goal.")

    myGoal.goal.target_pose.header.frame_id = "odom"
    myGoal.goal.target_pose.header.stamp = rospy.Time.now()
    myGoal.goal.target_pose.pose.position.x = 9
    myGoal.goal.target_pose.pose.position.y = 3

    q = tf.transformations.quaternion_from_euler(0, 0, math.pi)
    myGoal.goal.target_pose.pose.orientation.x = q[0]
    myGoal.goal.target_pose.pose.orientation.y = q[1]
    myGoal.goal.target_pose.pose.orientation.z = q[2]
    myGoal.goal.target_pose.pose.orientation.w = q[3]

    pub.publish(myGoal)
    rospy.loginfo("Node exiting.")

    rospy.sleep(30);
    rospy.loginfo("Setting the robot goal.")

    myGoal.goal.target_pose.header.frame_id = "odom";
    myGoal.goal.target_pose.header.stamp = rospy.Time.now();
    myGoal.goal.target_pose.pose.position.x = 1;

    pub.publish(myGoal)
    rospy.loginfo("Node exiting.")

if __name__ == '__main__':
    try:
        husky_mover()
    except rospy.ROSInterruptException: pass
