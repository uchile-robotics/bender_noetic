#!/bin/bash

# Iterar sobre cada submódulo
git submodule foreach '
  # Verificar si la rama feat-noetic existe en el submódulo
  if git show-ref --verify --quiet refs/heads/feat-noetic; then
    echo "Updating submodule $name to branch feat-noetic"
    git checkout feat-noetic
    git pull origin feat-noetic
  else
    echo "Branch feat-noetic does not exist in submodule $name. Skipping."
  fi
'
