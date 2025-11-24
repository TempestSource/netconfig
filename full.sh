#!/bin/sh

terraform apply && cd nix && bash provision.sh
