#!/bin/sh

## ALEPORT
nixos-rebuild switch --flake ./#aleport --target-host "root@192.168.20.102"

## REMBER
