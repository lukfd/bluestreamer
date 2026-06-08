#!/bin/bash

set -euo pipefail

cmd="${1:-}"

usage() {
    echo "Usage: $0 [list|sink|show]"
}

if [ "$cmd" = "list" ]; then
    bluetoothctl devices
elif [ "$cmd" = "sink" ]; then
    bluetoothctl <<'EOF'
power on
pairable on
discoverable on
agent NoInputNoOutput
default-agent
EOF
elif [ "$cmd" = "show" ]; then
    bluetoothctl show
else
    usage
    exit 2
fi