{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs@{ self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      hmConfigurations = {
        my-machine = home-manager.lib.homeManagerConfiguration {
          configuration = { config, pkgs, ... }: { imports = [ ./home.nix ]; };
          system = "x86_64-linux";
          # homeDirectory = "/home/dt";
          # username = "dt";
        };
        z3 = home-manager.lib.homeManagerConfiguration {
          configuration = { config, pkgs, ... }: { imports = [ ./home.nix ]; };
          system = "x86_64-linux";
          # homeDirectory = "/home/dt";
          # username = "dt";
        };
      };

    in {
      nixosConfigurations = {
        my-machine = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [ ./configuration.nix ];
        };
        z3 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [ ./configuration.nix ];
        };
      };
      home-manager.users = { dt = hmConfigurations.my-machine; };
    };
}
# fix The option `home' does not exist.
