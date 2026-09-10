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
│   ├── common.nix     # 共用配置
│   ├── wsl.nix        # WSL 专属
│   └── pc.nix         # 物理机专属
├── secrets/
│   ├── secrets.nix    # agenix 规则（收件人公钥）
│   └── env.age        # 加密的隐私环境变量
└── home-manager/      # Home Manager 配置
    ├── home.nix       # 入口，声明 age.secrets.env
    ├── zsh.nix
    ├── tmux.nix
    └── yazi.nix
```

## 隐私环境变量（agenix）

在 home.nix 中声明 `age.secrets.env`，激活时自动用 `~/.ssh/id_ed25519`
解密到 `$XDG_RUNTIME_DIR/agenix/env`，zsh 启动时自动加载其中的 export。

```sh
cd secrets
agenix -e env.age   # 编辑加密文件
agenix -d env.age   # 查看解密内容
```

## 使用

```sh
# 应用配置
sudo nixos-rebuild switch --flake .#wsl   # 或 .#pc

# 更新依赖
nix flake update
```


## 起步配置

一键配置镜像源并安装 git

```sh
sudo tee /etc/nix/nix.conf > /dev/null <<'EOF'
substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://mirrors.ustc.edu.cn/nix-channels/store https://cache.nixos.org/
experimental-features = nix-command flakes
EOF
sudo systemctl restart nix-daemon
nix-env -iA nixpkgs.git
```
