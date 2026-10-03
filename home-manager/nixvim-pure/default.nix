{ pkgs, ... }:
{
  programs.nixvim = {
    nixpkgs.pkgs = pkgs;
    enable = true;
    defaultEditor = true;

    imports = [
      ./core
      ./plugins
    ];
  };
}
