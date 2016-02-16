#!/usr/bin/env python
#import roslib; roslib.load_manifest('robot_mover')
import rospy


from move_base_msgs.msg import MoveBaseActionGoal
from geometry_msgs.msg import PoseStamped

def husky_mover():
    pub = rospy.Publisher('/move_base/goal', MoveBaseActionGoal)
    rospy.init_node('husky_mover')

    myGoal = MoveBaseActionGoal()
    targetPos = PoseStamped()

    rospy.sleep(1);
    
    rospy.loginfo("Setting the robot goal.")


    myGoal.goal.target_pose.header.frame_id = "odom";
    myGoal.goal.target_pose.header.stamp = rospy.Time.now();
    myGoal.goal.target_pose.pose.position.x = 10;
    myGoal.goal.target_pose.pose.position.y = 8;
    myGoal.goal.target_pose.pose.orientation.w = 1.0;

    pub.publish(myGoal);


    rospy.loginfo("Node exiting.");

if __name__ == '__main__':
    try:
        husky_mover()
    except rospy.ROSInterruptException: pass
