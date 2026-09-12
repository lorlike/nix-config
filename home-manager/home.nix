{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./yazi.nix
    ./tmux.nix
  ];

  home.username = "lorlike";
  home.homeDirectory = "/home/lorlike";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    btop

    gcc
    rustc
    cargo

    yazi
    lazygit

    nodejs
    pnpm

    python311
    gnumake

    pi-coding-agent
  ];

  # agenix：激活 home-manager 时解密隐私文件（使用 ~/.ssh 默认私钥）
  age.secrets.env.file = ../secrets/env.age;

  home.sessionVariables = {
    PNPM_HOME = "${config.home.homeDirectory}/.local/share/pnpm";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/share/pnpm/bin"
  ];

  home.file.".npmrc".text = ''
    registry=https://registry.npmmirror.com/
  '';

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "lorlike";
        email = "lorlike.me@gmail.com";
      };
    };
  };


}
