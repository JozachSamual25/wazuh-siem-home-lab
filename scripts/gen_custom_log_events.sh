#!/usr/bin/env bash
# Writes 6 failed-login lines for the custom application log on the Wazuh server
# so rule 100101 (5 failures from one IP inside 60 s) crosses its threshold.
set -euo pipefail
LOG=/var/log/custom_app.log
LINE='custom_app: Failed login for user admin from 203.0.113.50'
sudo touch "$LOG"
for i in 1 2 3 4 5 6; do
  echo "$(date '+%b %d %H:%M:%S') $(hostname) $LINE" | sudo tee -a "$LOG" >/dev/null
done
echo "Wrote 6 events to $LOG"
