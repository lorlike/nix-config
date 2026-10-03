{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
    nixos-wsl.url = "git+https://ghfast.top/https://github.com/nix-community/NixOS-WSL.git?ref=main";
    home-manager = {
      url = "git+https://ghfast.top/https://github.com/nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "git+https://ghfast.top/https://github.com/ryantm/agenix";
    nixvim.url = "git+https://ghfast.top/https://github.com/nix-community/nixvim";
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, agenix, nixvim, ... }:
    let
      system = "x86_64-linux";
      # 两个 host 共用的 home-manager 配置
      homeManagerModule = {
        home-manager = {
          useUserPackages = true;
          useGlobalPkgs = true;
          users.lorlike = ./home-manager/home.nix;
          sharedModules = [
            agenix.homeManagerModules.default
            nixvim.homeModules.nixvim
          ];
        };
      };
      common_modules = [
        ./nixos/common.nix
        home-manager.nixosModules.home-manager
        homeManagerModule
        {
          environment.systemPackages = [ agenix.packages.${system}.default ];
        }
      ];
    in {
      nixosConfigurations = {
        # WSL 虚拟机: sudo nixos-rebuild switch --flake .#wsl
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            nixos-wsl.nixosModules.default
            ./nixos/wsl.nix
          ]++common_modules;
        };

        # 物理机: sudo nixos-rebuild switch --flake .#pc
        pc = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./nixos/pc.nix
          ]++common_modules;
        };
      };
    };
}
