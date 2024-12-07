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

# Instalar AriaCoda si no se ha solicitado omitir
if $install_ariacoda; then
    echo "Instalando AriaCoda..."
    cd

    # Actualizar lista de paquetes
    sudo apt update

    git clone https://github.com/reedhedges/AriaCoda.git
    cd AriaCoda
    make || { echo "Error en make"; exit 1; }
    sudo apt install -y doxygen
    make doc || { echo "Error en make doc"; exit 1; }
    sudo make install || { echo "Error en make install"; exit 1; }
    cd ..
    cd bender_noetic
else
    echo "Omitiendo la instalación de AriaCoda."
fi

# Instalar las dependencias
echo "Instalando dependencias..."
sudo apt update
sudo apt install -y ros-noetic-rviz-* ros-noetic-openni2* ros-noetic-rosserial-arduino ros-noetic-urg-node ros-noetic-joy ros-noetic-joy-teleop ros-noetic-joy-listener ros-noetic-effort-controllers ros-noetic-ira-laser-tools* ros-noetic-dwa-local-planner* libfftw3-dev ros-noetic-realsense2* ros-noetic-dynamixel-workbench-msgs python3-pip ros-noetic-move-base-msgs

# Actualizar pip
pip install --upgrade pip

# Instalar los paquetes de Python
pip install mock termcolor

echo "Actualizando submodulos de git..."

# Inicializar submodulos
git submodule init
git submodule update

# Iterar sobre cada submódulo
git submodule foreach '
  # Verificar si la rama feat-noetic existe en el submódulo
  if git branch -r | grep -q "origin/feat-noetic"; then
    echo "Actualizando submódulo $name a la rama feat-noetic"
    git checkout feat-noetic
    git pull origin feat-noetic
  else
    echo "La rama feat-noetic no existe en el submódulo $name. Saltando."
  fi
'

# Compilar
echo "Compilando.."
catkin_make || { echo "Error en catkin_make"; exit 1; }
