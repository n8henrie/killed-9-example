#!/usr/bin/env bash
# https://github.com/NixOS/nixpkgs/issues/162795

git checkout src/main.rs

cargo clean
i=0
while cargo run; do
  sed -i "s/world[0-9]*/$((i++))/" src/main.rs
done
