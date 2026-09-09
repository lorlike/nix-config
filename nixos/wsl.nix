# WSL 专用配置
{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "lorlike";
}
