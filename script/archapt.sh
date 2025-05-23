#!/bin/bash

# archapt v1.1.0 - made with <3 by Spark

# default variables
skip=0 # 0 = false, 1 = true
usesyu=1 # 2 = use -Sy
norun=0
norns=0
flag_upgrade=0
flag_update=0
args=()
flags=() # currently unused but it doesn't matter

# FLAG PARSING
for arg in "$@"; do
  case "$arg" in
    --noconfirm)
      skip=1
      ;;
    --noupgrade)
      usesyu=0
      flag_upgrade=1
      ;;
    --update)
      usesyu=2
      flag_update=1
      ;;
    --dry-run)
      norun=1
      ;;
    --dont-remove-depends)
      norns=1
      ;;
    -*)
      flags+=("$arg")
      ;;
    *)
      args+=("$arg")
      ;;
  esac
done

if [[ $flag_upgrade -eq 1 && $flag_update -eq 1 ]]; then
  echo "Error: You cannot use --noupgrade and --update at the same time."
  echo "(1) --noupgrade"
  echo "(2) --update"
  echo "(q) exit"
  echo "Pick an option from the above."
  read -p "> " confirm2
  if [[ "$confirm2" -eq 1 ]]; then
      flag_update=0
      usesyu=0
  elif [[ "$confirm2" -eq 2 ]]; then
      flag_upgrade=0
      usesyu=2
  else
    exit 1
  fi
fi

help() {
  echo "Supported Commands:"
  echo "install"
  echo "remove, autoremove, uninstall"
  echo "update"
  echo "upgrade"
  echo "search"
  echo "list"
  echo "info"
  echo "...but not moo."
  echo "Flags:"
  echo "--noconfirm: Skips archapt and pacman's confirm prompts."
  echo "--noupgrade: Uses -S instead of -Syu. Does not work with --update."
  echo "--update: Uses -Sy instead of -Syu. Does not work with --noupgrade."
  echo "--dry-run: Doesn't actually run the pacman command. It's only there for your self-esteem."
  echo "Usage: apt <command> <package> <flags>"
  echo "archapt - Made with <3 by Spark"
}

run() {
  echo "+ Running: $*"
  if [[ $norun -eq 1 ]]; then
    echo "(dry run)"
    exit 0
  fi
  if [[ $skip -eq 1 ]]; then
    bash -c "$*"
    return
  fi
  echo "Proceed? [Y/n]"
  read -p "> " confirm
  if [[ "$confirm" =~ ^[Nn]$ ]]; then
    echo "Aborted."
  else
    bash -c "$*"
  fi  
}

translate() {
  cmd="${args[0]}"
  packages=("${args[@]:1}")
  
  case "$cmd" in
    install)
      if [[ $usesyu -eq 1 ]]; then
        run "sudo pacman -Syu ${skip:+--noconfirm} ${packages[*]}"
      elif [[ $usesyu -eq 2 ]]; then
        run "sudo pacman -Sy ${skip:+--noconfirm} ${packages[*]}"
      else
        run "sudo pacman -S ${skip:+--noconfirm} ${packages[*]}"
      fi
      ;;
    remove|autoremove|uninstall)
      if [[ $norns -eq 0 ]]; then
        run "sudo pacman -Rns ${skip:+--noconfirm} ${packages[*]}"
      else
        run "sudo pacman -R ${skip:+--noconfirm} ${packages[*]}"
      fi
      ;;
    update)
      run "sudo pacman -Sy ${skip:+--noconfirm}"
      ;;
    upgrade)
      run "sudo pacman -Syu ${skip:+--noconfirm}"
      ;;
    search)
      run "sudo pacman -Ss ${packages[*]}"
      ;;
    list)
      run "sudo pacman -Q" 
      ;;
    info)
      run "sudo pacman -Qi ${packages[*]}"
      ;;
    moo)
      echo "brother this is not debian" # i am not adding the ascii cow
      ;;
    help|-h)
      help
      ;;
    *)
      echo "Invalid command: $cmd"
      help
      ;;
  esac
}

if [[ $# -eq 0 ]]; then
  help
  exit 1
fi

translate
