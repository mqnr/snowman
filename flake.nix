{
  description = "NixOS config for Acer Aspire laptop with LUKS encryption, Btrfs and labwc";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, emacs-overlay, ... }@inputs:
    let
      username = "martin";
    in {
      nixosConfigurations = {
        tigris = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/tigris

            ({ config, pkgs, ... }: {
              nixpkgs.overlays = [ emacs-overlay.overlays.default ];
            })

            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./home;
              };
            }
          ];
        };
      };
    };
}
