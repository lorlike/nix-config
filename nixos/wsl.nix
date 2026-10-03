# WSL 专用配置
{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "lorlike";

  # 修复 WSL 互操作（binfmt_misc WSLInterop）在 systemd 接管后丢失的问题
  # 现象：cmd.exe / powershell / jj 等 Windows 程序报 "cannot execute binary file"
  systemd.services.wsl-interop = {
    description = "Re-register WSL interop binfmt handler";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      echo ':WSLInterop:M::MZ::/init:PF' > /proc/sys/fs/binfmt_misc/register
    '';
  };
}
