#!/bin/sh
#
# Before running this you must set a password in the vm for root
# The IP is auto-assigned from my DHCP server based on the MAC address
# Also, please change the password for users from the default

tmp=$(mktemp -d)

# Function to cleanup temporary directory on exit
cleanup() {
  rm -rf "$tmp"
}
trap cleanup EXIT

# Create the directory where sshd expects to find the host keys
install -d -m755 "$tmp/etc/ssh"

# Decrypt your private key from the password store and copy it to the temporary directory
cp /home/lain/.ssh/id_docker "$tmp/etc/ssh/ssh_host_ed25519_key"

# Set the correct permissions so sshd will accept the key
chmod 600 "$tmp/etc/ssh/ssh_host_ed25519_key"


## ALEPORT
nix run github:nix-community/nixos-anywhere -- --flake ./#aleport --generate-hardware-config nixos-generate-config ./aleport/hardware-configuration.nix --extra-files "$tmp" --target-host root@192.168.20.102
