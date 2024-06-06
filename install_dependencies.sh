#!/bin/bash

# Acualizar lista de paquetes
sudo apt update

# Instala las depencias
# Nota: podría quedar todo en una línea, pero así es más
# ordenado y cómodo de ver.
sudo apt install ros-noetic-openni2*
sudo apt install ros-noetic-rosserial-arduino
sudo apt install ros-noetic-urg-node
sudo apt install ros-noetic-joy
sudo apt install ros-noetic-joy-teleop
sudo apt install ros-noetic-joy-listener
sudo apt install ros-noetic-effort-controllers
sudo apt install libboost-signals-dev
sudo apt install ros-noetic-ira-laser-tools*
sudo apt install ros-noetic-dwa-local-planner*
sudo apt install libfftw3-dev
sudo apt install ros-noetic-realsense2* # Puede que necesite compilado desde source

# Actualiza pip
pip install --upgrade pip

# Instala los paquetes de Python
pip install mock termcolor

