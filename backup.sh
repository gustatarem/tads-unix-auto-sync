#!/bin/bash

date=$(date '+%Y:%m:%d_%H-%M-%S');

Question() {
  echo "---------- SEJA BEM VINDO AO SISTEMA DE BACKUP AUTOMÁTICO  ----------"
  echo "Deseja selecionar uma pasta diferente para backup?"
  echo
  echo "1. sim"
  echo "2. não"
  echo

  read option

  case $option in
  1) Change ;;
  2) Default ;;
  *) echo "Ops! Parece que você selecionou uma opção inválida, tente novamente." ; echo ; Backup ;;
  esac
}

Change() {
  echo "Digite o caminho para a pasta que deseja fazer backup"
  echo
  
  read newPath

  echo "Digite o caminho para a pasta onde será armazenado o backup"
  echo

  read newDestinationPath
  
  defaultDestination=$newDestinationPath/BACKUP_$date

  clear
  rsync -auvh --progress "$newPath" "$defaultDestination";
  echo "O backup da pasta $newPath foi armazenado na pasta $defaultDestination."
  echo "Execute o arquivo script.sh caso queira definir uma automação para o processo!"
}

Default() {
  dataPath=$HOME/Desktop/original

  destinationPath=$HOME/Desktop/backup/BACKUP_$date

  clear
  rsync -auvh --progress "$dataPath" "$destinationPath";
  echo "O backup da pasta $dataPath foi armazenado na pasta $destinationPath."
  echo "Execute o arquivo script.sh caso queira definir uma automação para o processo!"
}

Question

