#!/bin/bash

# Associative array mapping server IPs to device names
declare -A server_devices=(
    ["server"]="server"
    ["desktop"]="desktop"
)
#nix flake update
# Loop through each server and run the nixos-rebuild command
for server in "${!server_devices[@]}"; do
    device="${server_devices[$server]}"
    echo "Updating server at IP: $server with device: $device"
    nixos-rebuild switch --flake .#$device --target-host root@$server --upgrade
done
