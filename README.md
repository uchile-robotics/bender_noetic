# Bender ROS Noetic provisional repository
Este repo es provisional hasta que se complete en su totalidad para posteriormente integrarlo al workspace de [uchile_system](https://github.com/uchile-robotics/uchile_system/).
# Instalación
## Prerequisitos
### ROS Noetic
*AVISO: Esta sección se puede ignorar si es que ROS ya está instalado en la máquina. En tal caso, asegurate de tener instalado rosdep: `sudo apt-get install python-{rosinstall,pip,rosdep}`.*

Ejecutar en terminal (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>)

```bash
# ROS Keys
# ver: http://wiki.ros.org/noetic/Installation/Ubuntu
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo -E apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# actualizar base de software
sudo apt-get update

# instalar ROS
sudo apt install ros-noetic-desktop-full python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# inicializar rosdep
sudo rosdep init # ignorar si es que falla con "ERROR: default sources list file already exists:..."
rosdep update    # NO EJECUTAR CON SUDO!
```

## Instalación del repositorio
*NOTA: Este paso está diseñado para instalar el repo directamente en la raíz del sistema (A.K.A. Carpeta Home), si deseas instalarlo en otro lado ajeno a Home, tendrás que realizarlo manualmente por tu cuenta.*

En una nueva terminal, clona el repositorio:
```bash
git clone https://github.com/uchile-robotics/bender_noetic
```

Recueda que esto te deja con la rama principal (main), normalmente, se utiliza develop y/o feature dependiendo del caso. Dentro de la carpeta del repositorio puedes ejecutar lo siguiente para cambiar de rama:
```bash
git checkout <nombre_rama>
git checkout develop
```

Luego, entra a la carpeta del repositorio y ejecuta el instalador. Recuerda que necesitarás que tu usuario de github tenga acceso a los repositorios de Uchile-Robotics, en caso de que no tengas acceso, solicitalo directamente con algún tutor.

*PD: Recuerda también que github ya no permite utilizar directamente tu contraseña, necesitarás usar tu [token personalizado](https://github.com/settings/tokens) cuando el instalador te pida tu contraseña. (No te preocupes, no utilizaremos tus datos para actos fraudulentos, por ahora).*
```bash
cd bender_noetic

# Nota: El repositorio requiere del paquete Aria para hacer funcionar la base de Bender, en el caso que ya tengas instalado Aria o AriaCoda debes utilizar
# el parámetro "-s" para que no vuelva a instalarlo y se salte inmediatamente a la instalación de dependencias.

# Si no tienes AriaCoda instalado:
sudo ./setup.sh

# Si tienes AriaCoda instalado:
sudo ./setup.sh -s
```

# ¡Felicidades!, has instalado el nuevo repositorio de Bender para ROS Noetic.
*Nota: Si llegaste a tener algún error relacionado con los submódulos de git, o bien, notas que no se cambiaron a sus respectivas ramas (feat-noetic). Puedes ejecutar un script que soluciona esto:*

```bash
cd bender_noetic
./submodules_fix.sh
```
