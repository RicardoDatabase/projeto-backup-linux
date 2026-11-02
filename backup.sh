#!/bin/bash

ORIGEM="/home/banco/dados"
DESTINO="/backup/backup_diario"
LOG="/var/log/backup/backup_diario.log"
DATA=$(date +%Y-%m-%d_%H-%M-%S)
ARQUIVO="$DESTINO/backup_$DATA.tar.gz"

echo "[$(date)] iniciando backup" >> "$LOG"

if [ ! -d "$ORIGEM" ]; then
echo "[$(date)] ERRO origem não encontrado" >> "$LOG"
exit 1
fi

if tar -czf "$ARQUIVO" -C "$ORIGEM" .; then
echo "[$(date)] Backup realizado com sucesso: $ARQUIVO" >> "$LOG"
else
echo "[$(date)] Backup não realizado" >> "$LOG"
rm -f "$ARQUIVO"
exit 1
fi

if find "$DESTINO" -maxdepth 1 -type f -name 'backup_*.tar.gz' -mtime +7 -delete; then
echo "[$(date)] Limpeza de backups antigos concluida" >> "$LOG"
else
echo "[$(date)] ERRO: Falha na limpeza de backups antigos" >> "$LOG"
exit 1
fi 

echo "[$(date)] Backup finalizado" >> "$LOG"
exit 0


