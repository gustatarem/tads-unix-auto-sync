#!/bin/bash

Backup() {
  echo "---------- SEJA BEM VINDO AO SISTEMA DE BACKUP AUTOMÁTICO  ----------"
  echo "Quem é você?!"
  read name
  echo "Olá $name! Que bom ter você de volta por aqui!"
  echo "Escolha a frequência com a qual quer que o backup seja realizado:"
  echo
  echo "1. A cada hora"
  echo "2. A cada dia"
  echo "3. A cada semana"
  echo "4. A cada mês"

  read option

  case $option in
    1) Hourly ;;
    2) Daily ;;
    3) Weekly ;;
    3) Monthly ;;
    *) echo "Ops! Parece que você selecionou um intervalo inválido, tente novamente." ; echo ; Backup ;;
  esac
}

Hourly() {
  clear
  (crontab -l 2>/dev/null; echo "01 * * * * /Users/gustatarem/Documents/UFPR/admsis/tads-unix-auto-sync/backup.sh") | crontab -
  echo "Seu backup será realizado toda hora a partir de agora!"
}

Daily() {
  clear
  (crontab -l 2>/dev/null; echo "02 4 * * * /Users/gustatarem/Documents/UFPR/admsis/tads-unix-auto-sync/backup.sh") | crontab -
  echo "Seu backup será realizado todo dia a partir de agora!"
}

Weekly() {
  clear
  (crontab -l 2>/dev/null; echo "22 4 * * 0 /Users/gustatarem/Documents/UFPR/admsis/tads-unix-auto-sync/backup.sh") | crontab -
  echo "Seu backup será realizado toda semana a partir de agora!"
}

Monthly() {
  clear
  (crontab -l 2>/dev/null; echo "42 4 1 * * /Users/gustatarem/Documents/UFPR/admsis/tads-unix-auto-sync/backup.sh") | crontab -
  echo "Seu backup será realizado todo mês a partir de agora!"
}

clear

Backup
