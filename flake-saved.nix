{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # nixosConfigurations.z1 = nixpkgs.lib.nixosSystem
    #   {
    #     system = "x86_64-linux";
    #     networking.hostName = "z1"; # Define your hostname.

    #     modules = [
    #       # Import the previous configuration.nix we used,
    #       # so the old configuration file still takes effect
    #       ./hosts/z3/configuration.nix
    #     ];
    #   };
    # nixosConfigurations.z2 = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   networking.hostName = "z2"; # Define your hostname.

    #   modules = [
    #     # Import the previous configuration.nix we used,
    #     # so the old configuration file still takes effect
    #     ./hosts/z3/configuration.nix
    #   ];
    # };


    # nixosConfigurations.container = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules =
    #     [ ({ pkgs, ... }: {
    #         boot.isContainer = true;

    #         # Let 'nixos-version --json' know about the Git revision
    #         # of this flake.
    #         system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;

    #         # Network configuration.
    #         networking.useDHCP = false;
    #         networking.firewall.allowedTCPPorts = [ 80 ];

    #         # Enable a web server.
    #         services.httpd = {
    #           enable = true;
    #           adminAddr = "morty@example.org";
    #         };
    #       })
    #     ];
    # };


    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./configuration.nix ];
    };
    nixosConfigurations.z3 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # networking.hostName = "z3"; # Define your hostname.

      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hosts/z3/hardware-configuration.nix
      ];
    };
  };
}
