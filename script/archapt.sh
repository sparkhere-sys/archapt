#!/bin/bash

# archapt v1.0.2
skip=0
for arg in "$@"; do
  if [[ arg == "--no-confirm" ]]; then
    skip=1
    set -- "${@//arg/}"
    break
  fi
done

run() {
  echo "+ Running: $*"
  if [[ $skip -eq 1 ]]; then
    eval "$*"
    return
  fi
  read -p "Proceed? [Y/n]: "; confirm=
  if [[ "$confirm" =~ ^[Nn]$ ]]; then
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
