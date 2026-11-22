#!/usr/bin/env bash
# Run on the Wazuh server after every boot, before starting Kali.
echo "== Memory =="; free -h
echo; echo "== Wazuh services =="
for s in wazuh-indexer wazuh-manager filebeat wazuh-dashboard; do
  printf '%-18s %s\n' "$s" "$(systemctl is-active $s)"
done
echo; echo "== Indexer heap =="; grep -E '^-Xm' /etc/wazuh-indexer/jvm.options
echo; echo "== Recent OOM kills (should be empty) =="; sudo dmesg | grep -i -E 'out of memory|killed process' | tail -5
