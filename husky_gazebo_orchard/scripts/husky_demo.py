#!/usr/bin/env python
import os
import husky_mover

if __name__ == '__main__':
    os.system("roslaunch husky_gazebo_orchard husky_orchard_demo.launch")
    # Need parallel
    try:
        husky_mover()
    except rospy.ROSInterruptException: pass
