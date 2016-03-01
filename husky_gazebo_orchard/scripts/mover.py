#!/usr/bin/env python
#import roslib; roslib.load_manifest('robot_mover')
import rospy

from geometry_msgs.msg import Twist

def mover():
    pub = rospy.Publisher('/husky_velocity_controller/cmd_vel', Twist, queue_size=10)
    rospy.init_node('robot_mover')

    twist = Twist()

    rospy.sleep(0.1);
    rospy.loginfo("Moving the robot backward.   1")
    twist.linear.x = -1; # move backward at 1 m/s  
    pub.publish(twist)
    rospy.sleep(0.1);
    rospy.loginfo("Moving the robot backward.   2")
    pub.publish(twist)
    rospy.sleep(0.1);
    rospy.loginfo("Moving the robot backward.   3")
    pub.publish(twist)
    rospy.sleep(0.1);
    rospy.loginfo("Moving the robot backward.   4")
    pub.publish(twist)
    rospy.sleep(0.1);
    rospy.loginfo("Moving the robot backward. 5")
    pub.publish(twist)
    rospy.sleep(1);

    rospy.loginfo("Moving the robot forward.")
    twist.linear.x = 0.5; # move forward at 0.1 m/s  
    pub.publish(twist)
    rospy.sleep(1)

    rospy.loginfo("Turning the robot left.");
    twist = Twist();
    twist.angular.z = 0.5
    pub.publish(twist)
    rospy.sleep(1);
    
    rospy.loginfo("Turning the robot right.");
    twist.angular.z = -0.5
    pub.publish(twist)
    rospy.sleep(5);

    rate=rospy.Rate(100)
    while not rospy.is_shutdown():
        rospy.loginfo("Moving the robot round.")
        twist.linear.x = 0.5; # move forward at 0.1 m/s  
        pub.publish(twist)
        rate.sleep()

    rospy.loginfo("Node exiting.");

if __name__ == '__main__':
    try:
        mover()
    except rospy.ROSInterruptException: pass
