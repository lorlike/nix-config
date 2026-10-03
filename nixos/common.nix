# WSL 与物理机共用的配置
{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos";

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  nix.settings = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"  # 清华
      "https://mirrors.ustc.edu.cn/nix-channels/store"     # 中科大
      "https://cache.nixos.org/"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  environment.systemPackages = with pkgs; [
    # neovim
    git wget curl zsh
  ];

  programs.git.config = {
    url."https://github.com/".insteadOf = "https://ghfast.top/https://github.com/";
  };

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  users.users.lorlike = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable sudo for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };


  # 首次安装 NixOS 时使用的版本，之后不要改动
  system.stateVersion = "26.05";
}
