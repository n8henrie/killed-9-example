#!/usr/bin/env bash
# https://github.com/NixOS/nixpkgs/issues/162795

cleanup() {
  git checkout src/main.rs
}
trap cleanup EXIT

git checkout src/main.rs
cargo clean
i=0
while cargo run; do
  sed -i "s/world[0-9]*/world$((++i))/" src/main.rs
done
