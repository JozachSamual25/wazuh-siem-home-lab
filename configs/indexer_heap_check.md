# Indexer heap check (low-RAM lab)

```bash
grep -E '^-Xm' /etc/wazuh-indexer/jvm.options
```

For a 4 GB lab VM with one monitored host, a 1 GB heap is enough and leaves RAM for the
manager and dashboard. If you need to change it, keep `-Xms` and `-Xmx` equal:

```bash
sudo sed -i -e 's/^-Xms.*/-Xms1g/' -e 's/^-Xmx.*/-Xmx1g/' /etc/wazuh-indexer/jvm.options
sudo systemctl restart wazuh-indexer
ps -o args= -C java | grep -oE "Xm[sx][0-9]+[mg]" | sort -u
```
