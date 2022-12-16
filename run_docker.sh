docker run --restart unless-stopped --name ros -e "ROS_IP=10.42.0.99" -v /home/pi/catkin_ws:/catkin_ws --network host --device /dev/i2c-1 -u root alpine-ros
