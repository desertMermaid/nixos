{
  description = "Multi-DE Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };

    b123d-server = {
      url = "github:dispersia/build123d_server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    darwinSystem = "aarch64-darwin";
    mkDarwinHost = hostName: username:
      inputs.nix-darwin.lib.darwinSystem {
        system = darwinSystem;
        specialArgs = {
          inherit inputs hostName username;
        };

        modules = [
          ./hosts/${hostName}

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${username} = {
              imports = [
                ./users/${username}/home.nix
              ];
            };

            home-manager.extraSpecialArgs = {
              inherit inputs hostName username;
            };
          }
          ({pkgs, ...}: {
            environment.shells = with pkgs; [
              nushell
            ];
          })
        ];
      };
  in {
    formatter.${darwinSystem} =
      nixpkgs.legacyPackages.${darwinSystem}.alejandra;

    darwinConfigurations = {
      ML-GW2WWR5V4D =
        mkDarwinHost "ML-GW2WWR5V4D" "JeCruz";
    };
  };
}
