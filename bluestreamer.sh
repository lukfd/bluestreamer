#!/bin/bash

set -euo pipefail

cmd="${1:-}"

usage() {
    echo "Usage: $0 [list|start <device_address>|pair <device_address>|trust <device_address>|sink]"
}

if [ "$cmd" = "list" ]; then
    bluetoothctl devices
elif [ "$cmd" = "start" ]; then
    if [ -z "${2:-}" ]; then
        usage
        exit 2
    fi
    bluetoothctl power on && bluetoothctl connect "${2}"
elif [ "$cmd" = "pair" ]; then
    if [ -z "${2:-}" ]; then
        usage
        exit 2
    fi
    bluetoothctl power on && bluetoothctl pair "${2}"
elif [ "$cmd" = "trust" ]; then
    if [ -z "${2:-}" ]; then
        usage
        exit 2
    fi
    bluetoothctl trust "${2}"
elif [ "$cmd" = "sink" ]; then
    bluetoothctl <<'EOF'
power on
agent NoInputNoOutput
default-agent
discoverable on
pairable on
EOF
else
    usage
    exit 2
fi