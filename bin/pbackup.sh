#!/bin/bash
#
# pbackup, um script de backup :)
#
# autor: IsaquePFerreira <pferreiraisaque@gmail.com>
# license: GPL3
#
# uso: ./pbackup
#

FILES_TO_BACKUP="$@"
BACKUP_DIR="$HOME/backup"
CURRENT_DATE=$(date '+%d-%m-%Y-%H-%M')
MACHINE_NAME=$(hostname)
BACKUP_FILE="$MACHINE_NAME-$CURRENT_DATE.tar.xz"

mkdir -p $BACKUP_DIR

echo 'Backup start...'
date

tar -cvJf "$BACKUP_DIR/$BACKUP_FILE" "$FILES_TO_BACKUP"

ls -hs "$BACKUP_DIR"

echo 'Backup finish!'
date

