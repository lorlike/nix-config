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

  home.sessionVariables = {
    PNPM_HOME = "${config.home.homeDirectory}/.local/share/pnpm";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/share/pnpm/bin"
  ];

  home.file.".npmrc".text = ''
    registry=https://registry.npmmirror.com/
  '';




}
