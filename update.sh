#!/bin/bash

# Associative array mapping server IPs to device names
declare -A server_devices=(
    ["192.168.1.100"]="server"
    ["192.168.1.102"]="desktop"
)

# Loop through each server and run the nixos-rebuild command
for server in "${!server_devices[@]}"; do
    device="${server_devices[$server]}"
    echo "Updating server at IP: $server with device: $device"
    nixos-rebuild switch --flake .#$device --target-host root@$server --upgrade
done
