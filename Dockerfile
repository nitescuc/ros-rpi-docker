FROM ros:noetic-robot

RUN apt update && apt install -y wget unzip

WORKDIR /catkin_ws
RUN mkdir /home/ros && chown 1000:1000 /home/ros
ENV HOME=/home/ros

RUN echo "deb http://archive.raspberrypi.org/debian/ buster main ui" > /etc/apt/sources.list.d/raspi.list && \
  wget https://archive.raspbian.org/raspbian.public.key -O - | apt-key add - && \
  wget https://archive.raspberrypi.org/debian/raspberrypi.gpg.key -O - | apt-key add - && \
  apt update

RUN apt update && apt install -y pigpio ros-noetic-rosbridge-server ros-noetic-tf2-web-republisher

ADD launch.sh /home/ros

RUN chown 1000:1000 /home/ros/launch.sh && chmod +x /home/ros/launch.sh

USER 1000

CMD /home/ros/launch.sh
