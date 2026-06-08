#!/bin/bash

set -euo pipefail

cmd="${1:-}"

usage() {
    echo "Usage: $0 [list|sink|show]"
}

if [ "$cmd" = "list" ]; then
    bluetoothctl devices
elif [ "$cmd" = "sink" ]; then
    echo "Configuring Ubuntu Server as an A2DP Audio Sink..."
    
    # Run these linearly using non-interactive one-liners
    bluetoothctl power on
    bluetoothctl pairable on
    bluetoothctl discoverable on
    
    echo "Server is now discoverable. Put your record player into pairing mode now."
elif [ "$cmd" = "show" ]; then
    bluetoothctl show
else
    usage
    exit 2
fi