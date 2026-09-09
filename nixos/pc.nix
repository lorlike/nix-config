# 物理机专用配置
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # 安装物理机时，先在安装环境里生成硬件配置:
  #   nixos-generate-config --root /mnt
  # 把生成的 /mnt/etc/nixos/hardware-configuration.nix 覆盖 nixos/hardware-configuration.nix

  # 引导程序（UEFI 常见配置；BIOS/MBR 机器需自行调整）
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  # 物理机上一般需要固件/非自由软件支持，按需打开:
  # nixpkgs.config.allowUnfree = true;
}
