# nix-config

个人 NixOS 配置，基于 Flakes + Home Manager。

## Hosts

| Host | 说明 | 构建 |
|------|------|------|
| `wsl` | WSL 虚拟机 | `sudo nixos-rebuild switch --flake .#wsl` |
| `pc`  | 物理机 | `sudo nixos-rebuild switch --flake .#pc` |

## 目录结构

```
├── flake.nix          # 入口，定义两个 host
├── nixos/
│   ├── common.nix     # 共用配置（中文 locale、镜像源、用户等）
│   ├── wsl.nix        # WSL 专属（NixOS-WSL）
│   └── pc.nix         # 物理机专属
└── home-manager/      # Home Manager 配置
    ├── home.nix       # 入口及常用软件包
    ├── zsh.nix
    ├── tmux.nix
    └── yazi.nix
```

## 使用

```sh
# 应用配置
sudo nixos-rebuild switch --flake .#wsl   # 或 .#pc

# 更新依赖
nix flake update
```
