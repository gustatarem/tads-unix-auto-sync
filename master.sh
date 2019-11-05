#!/bin/bash

date=$(date '+%Y:%m:%d_%H-%M-%S');
dataPath="$HOME/Desktop/original"
destinationPath="$HOME/Desktop/backup/BACKUP_$date"

Hello() {
  echo "---------- SEJA BEM VINDO AO SISTEMA DE AGENDAMENTO DE BACKUP AUTOMÁTICO  ----------"
  echo "Quem é você?!"
  read name
  echo "Olá $name! Que bom ter você de volta por aqui!"

  Backup
}

Backup() {
  echo "Deseja selecionar uma pasta diferente para backup?"
  echo
  echo "1. sim"
  echo "2. não"
  echo

  read option
  echo

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
  echo

  echo "Digite o caminho para a pasta onde será armazenado o backup"
  echo

  read newDestinationPath
  
  dataPath="$newPath"
  destinationPath="$newDestinationPath/BACKUP_$date"

  clear
  
  Interval
}

Default() {
  clear

  Interval
}

Interval() {
  echo "Escolha a frequência com a qual quer que o backup seja realizado:"
  echo
  echo "1. A cada minuto"
  echo "2. A cada hora"
  echo "3. A cada dia"
  echo "4. A cada semana"
  echo "5. A cada mês"

  read interval
  echo

  case $interval in
    1) Minute ;;
    2) Hourly ;;
    3) Daily ;;
    4) Weekly ;;
    5) Monthly ;;
    *) echo "Ops! Parece que você selecionou um intervalo inválido, tente novamente." ; echo ; Backup ;;
  esac
}

Minute() {
  (crontab -l 2>/dev/null; echo "* * * * * rsync -auvh --progress $dataPath $destinationPath") | crontab -
  echo "O backup da pasta $dataPath será armazenado na pasta $destinationPath e seu backup será realizado todo minuto a partir de agora!"
}

Hourly() {
  clear
  (crontab -l 2>/dev/null; echo "01 * * * * rsync -auvh --progress $dataPath $destinationPath") | crontab -
  echo "O backup da pasta $dataPath será armazenado na pasta $destinationPath e seu backup será realizado toda hora a partir de agora!"
}

Daily() {
  clear
  (crontab -l 2>/dev/null; echo "02 4 * * * rsync -auvh --progress $dataPath $destinationPath") | crontab -
  echo "O backup da pasta $dataPath será armazenado na pasta $destinationPath e seu backup será realizado todo dia a partir de agora!"
}

Weekly() {
  clear
  (crontab -l 2>/dev/null; echo "22 4 * * 0 rsync -auvh --progress $dataPath $destinationPath") | crontab -
  echo "O backup da pasta $dataPath será armazenado na pasta $destinationPath e seu backup será realizado toda semana a partir de agora!"
}

Monthly() {
  clear
  (crontab -l 2>/dev/null; echo "42 4 1 * * rsync -auvh --progress $dataPath $destinationPath") | crontab -
  echo "O backup da pasta $dataPath será armazenado na pasta $destinationPath e seu backup será realizado todo mês a partir de agora!"
}

Hello
