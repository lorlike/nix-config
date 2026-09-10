#!/usr/bin/env bash
# 用法: ./sync.sh [wsl|pc]  （不带参数时按 /proc/version 判断，含 microsoft 即 WSL）
set -euo pipefail

host="${1:-}"
if [[ -z "$host" ]]; then
  if grep -qi microsoft /proc/version 2>/dev/null; then
    host="wsl"
  else
    host="pc"
  fi
fi

echo ">>> checking flake"
sudo nix flake check --no-build

echo ">>> rebuilding host: $host"
sudo nixos-rebuild switch --flake ".#$host"
