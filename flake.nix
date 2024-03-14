# sudo nixos-rebuild -v --impure switch --no-flake
# home-manager switch
{
  description = "NixOS flake";

 
  inputs = {
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plugin-onedark.url = "github:navarasu/onedark.nvim";
    plugin-onedark.flake = false;
  };

#   outputs = { self, nixpkgs, ... }@inputs: {
#     # Please replace my-nixos with your hostname
#     nixosConfigurations.z1 = nixpkgs.lib.nixosSystem {
#       system = "x86_64-linux";
#       modules = [
#         # Import the previous configuration.nix we used,
#         # so the old configuration file still takes effect
#         ./configuration.nix
#       ];
#     };
#   };
# }


  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in {

      homeConfigurations."dt" =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./nixos/home.nix ];

          extraSpecialArgs = { inherit inputs; };
        };
    };
}