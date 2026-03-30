{
  description = "kypkk's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    username = "kangkang";

    mkDarwin = { hostname, system ? "aarch64-darwin", hostModules ? [] }:
      nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = hostModules ++ [
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { isDarwin = true; };
            home-manager.users.${username} = import ./home/default.nix;
          }
        ];
      };

    mkNixos = { hostname, system ? "aarch64-linux", hostModules ? [] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit username; };
        modules = hostModules ++ [
          { nixpkgs.config.allowUnfree = true; }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { isDarwin = false; };
            home-manager.users.${username} = import ./home/default.nix;
          }
        ];
      };
  in
  {
    darwinConfigurations = {
      kypkk = mkDarwin {
        hostname = "kypkk";
        hostModules = [ ./hosts/MacbookProKypkk/default.nix ];
      };
    };

    nixosConfigurations = {
      nixos-vm = mkNixos {
        hostname = "nixos-vm";
        hostModules = [ ./hosts/nixos-vm/default.nix ];
      };
    };
  };
}