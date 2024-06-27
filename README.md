# Bender ROS Noetic provisional repository
Este repo es provisional hasta que se complete en su totalidad para posteriormente integrarlo al workspace de [uchile_system](https://github.com/uchile-robotics/uchile_system/).
# Instalación
## Prerequisitos
### ROS Noetic
*AVISO: Esta sección se puede ignorar si es que ROS ya está instalado en la máquina. En tal caso, asegurate de tener instalado rosdep: `sudo apt-get install python-{rosinstall,pip,rosdep}`.*

Ejecutar en terminal (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>)

```bash
# ROS Keys
# ver: http://wiki.ros.org/kinetic/Installation/Ubuntu
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo -E apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# actualizar base de software
sudo apt-get update

# instalar ROS
sudo apt-get install ros-kinetic-ros-base curl openssl pv python-rosinstall python-pip python-rosdep

## Submodulos de Git.

Este repositorio funciona con submódulos, es decir, puedes añadir otros repositorios a este como submódulos, esto permite un mejor espacio de trabajo. Si necesitas saber como usarlos, revisa la siguiente página: https://git-scm.com/book/en/v2/Git-Tools-Submodules

# inicializar rosdep
sudo rosdep init # ignorar si es que falla con "ERROR: default sources list file already exists:..."
rosdep update    # NO EJECUTAR CON SUDO!
```

# Pendiente terminar esto :D
