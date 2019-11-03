#!/bin/bash

date=$(date '+%Y:%m:%d_%H-%M-%S');

rsync -avh --progress "$HOME/Desktop/original" "$HOME/Desktop/backup/BACKUP_$date";