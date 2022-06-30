#!/bin/bash

SLEEP 10
source /catkin_ws/devel/setup.bash
roslaunch rosbridge_server rosbridge_websocket.launch &
rosrun tf2_web_republisher tf2_web_republisher &
roslaunch car_launcher car_launcher.launch
