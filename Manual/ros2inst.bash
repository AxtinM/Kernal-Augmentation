#!/bin/bash
#This script is brought from ros documentation to compile ros2 foxy
#on your machine organized by Kernel Augmentation Team to make things easier
#and faster for developers more complexity and depth will be included
#to automatically install all missing dependency before compiling
export UBUNTU_CODENAME=focal
sudo apt-get install libeigen3-dev

locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget
# install some pip packages needed for testing
python3 -m pip3 install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest
# install Fast-RTPS dependencies
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
# install Cyclone DDS dependencies
sudo apt install --no-install-recommends -y \
  libcunit1-dev

mkdir -p ~/ros2_foxy/src
cd ~/ros2_foxy
wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
vcs import src < ros2.repos

sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y --os=ubuntu:focal

cd ~/ros2_foxy/
#I think the stderr output you see is because you don't have 
#Connext or OpenSplice installed (which is fine).
#so the build instructions recommend ignoring them with the following command:
#
#
#
#
colcon build --symlink-install --packages-ignore qt_gui_cpp rqt_gui_cpp
#
#

#colcon build --symlink-install

