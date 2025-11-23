#!/bin/sh
#
# Before running this you must set a password in the vm for root
# The IP is auto-assigned from my DHCP server based on the MAC address
# Also, please change the password for users from the default

## ALEPORT
nix run github:nix-community/nixos-anywhere -- --flake ./#aleport --generate-hardware-config nixos-generate-config ./aleport/hardware-configuration.nix --target-host root@192.168.20.101
