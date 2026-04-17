#!/bin/bash

# Démarrer badvpn-udpgw
tmux new-session -d -s a0 'badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 250 --max-connections-for-client 3'

# Démarrer dropbear
tmux new-session -d -s b0 'dropbear -REF -p 40000 -W 65535'

# Démarrer nginx (load balancer)
nginx -g "daemon off;" &

# Démarrer proxy3.js
export PORT=${PORT:-8080}
export DHOST="127.0.0.1"
export DPORT="8080"
node proxy3.js
