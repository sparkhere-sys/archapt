#!/bin/bash

# archapt

run() {
  echo "+ Running: $*"
  read -p "Proceed? [Y/n]: " confirm
  if [[ "$confirm" =~ ^[Nn]$ ]] then
    echo "Aborted."
  else
    eval "$*"
  fi  
}

translate() {
  case "$1" in
    install)
      shift
      run "sudo pacman -Syu $*"
      ;;
    remove)
      shift
      run "sudo pacman -Rns $*"
      ;;
    update)
      run "sudo pacman -Sy"
      ;;
    upgrade)
      run "sudo pacman -Syu"
      ;;
    search)
      shift
      run "sudo pacman -Ss $*"
      ;;
    list)
      run "sudo pacman -Q" 
      ;;
    info)
      shift
      run "sudo pacman -Qi $*"
      ;;
    moo)
      echo "brother this is not debian"
      ;;
    *)
      echo "Invalid command. Available commands: install, remove, update, upgrade, search, list, info"
      ;;
  esac
}

if [[ $# -eq 0 ]]; then
  echo "Available commands: install, remove, update, upgrade, search, list, info"
  exit 1
fi

translate "$@"
