#!/bin/bash

# Variable para controlar si se debe instalar AriaCoda
install_ariacoda=true

# Función para mostrar el uso del script
usage() {
    echo "Uso: $0 [-s]"
    echo "  -s  Omitir la instalación de AriaCoda"
    exit 1
}

# Procesar los parámetros de línea de comandos
while getopts ":s" opt; do
    case ${opt} in
        s )
            install_ariacoda=false
            ;;
        \? )
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Actualizar lista de paquetes
sudo apt update

# Instalar AriaCoda si no se ha solicitado omitir
if $install_ariacoda; then
    echo "Instalando AriaCoda..."
    git clone https://github.com/reedhedges/AriaCoda.git
    cd AriaCoda
    make
    sudo apt install doxygen
    make doc
    sudo make install
    cd
else
    echo "Omitiendo la instalación de AriaCoda."
fi

# Instalar las dependencias
echo "Instalando dependencias..."
sudo apt update

sudo apt install -y ros-noetic-openni2*
sudo apt install -y ros-noetic-rosserial-arduino
sudo apt install -y ros-noetic-urg-node
sudo apt install -y ros-noetic-joy
sudo apt install -y ros-noetic-joy-teleop
sudo apt install -y ros-noetic-joy-listener
sudo apt install -y ros-noetic-effort-controllers
sudo apt install -y libboost-signals-dev
sudo apt install -y ros-noetic-ira-laser-tools*
sudo apt install -y ros-noetic-dwa-local-planner*
sudo apt install -y libfftw3-dev
sudo apt install -y ros-noetic-realsense2* # Puede que necesite compilado desde source
sudo apt install -y ros-noetic-dynamixel-workbench-msgs

# Actualizar pip
pip install --upgrade pip

# Instalar los paquetes de Python
pip install mock termcolor

# Compilar
catkin_make
