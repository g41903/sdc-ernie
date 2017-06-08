
# coding: utf-8

# In[ ]:

import rospy
from std_msgs.msg import Bool,Float32
from ackermann_msgs.msg import AckermannDriveStamped
from geometry_msgs.msg import PointStamped, Point
import numpy as np
import serial

class ServoNode(Node):
    target_theta = Param(float, default=-np.pi/2)
    target_dist = Param(float, default=.3)
    gain_theta = Param(float, default=.8)
    gain_dist = Param(float, default=-.4)


    def __init__(self):
        super(ServoNode, self).__init__()
        self.object_close = False
        self.wall_theta = None
        self.wall_dist = None
        rospy.Timer(rospy.Duration(.1), self.timer_callback)

    pub = rospy.Publisher('/racecar/ackermann_cmd_mux/input/navigation', AckermannDriveStamped, queue_size=10)
    pubServo=rospy.Publisher('/arduino/servo/steering_angle',Float32,queue_size=10)
    
    @Subscriber('/racecar/ackermann_cmd_mux/input/navigation', AckermannDriveStamped)
    def aduino_servo_callback(self, msg):
        self.data = msg.drive.steering_angle

    def timer_callback(self, event):
        cmd = AckermannDriveStamped()
        cmd.drive.steering_angle = 1.0
        cmd.drive.speed=0.1
        self.pubServo.publish(cmd)
        self.pub.publish(cmd)

    def on_shutdown(self):
        # Send a stop command before exiting.
        self.pub.publish(AckermannDriveStamped())

if __name__ == '__main__':
    rospy.init_node("driver_node")
    node = ServoNode()
    rospy.on_shutdown(lambda: node.on_shutdown())
    rospy.spin()


