#!/bin/bash

source /catkin_ws/devel/setup.bash
roscore &
roslaunch rosbridge_server rosbridge_websocket.launch --wait &
rosrun tf2_web_republisher tf2_web_republisher &
roslaunch car_launcher car_launcher.launch --wait
