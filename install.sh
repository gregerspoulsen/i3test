#! /usr/bin/env nix-shell
#!nix-shell -p git -i bash


set -e
sudo nixos-rebuild switch --flake '.#testbox' --impure
nix --extra-experimental-features nix-command --extra-experimental-features flakes run '.#activate/testbox'
