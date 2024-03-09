{
  description = "NixOS configuration";
}
  inputs.nixpkgs.url = {"nixpkgs/nixos-unstable"};
  outputs = inputs @ { self, nixpkgs }:
    let system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; 
      config = { allowUnfree = true; };
    }
    in {
      nixosConfigurations = {
        my-machine = nixpkgs.lib.nixosSystem {
          {specialArgs= {inherit system, inputs;};}
          modules = [ ./hosts/z3 ./configuration.nix ];

          # inherit system;
          # configuration = { config, lib, pkgs, ... }:
          # {
          #   imports = [ ./hardware-configuration.nix ];
          #   boot.loader.grub.enable = true;
          #   boot.loader.grub.version = 2;
          #   boot.loader.grub.device = "/dev/sda";
          #   boot.loader.grub.copyKernels = true;
          #   boot.loader.grub.efiSupport = true;
          #   boot.loader.grub.efiInstallAsRemovable = true;
          #   boot.loader.grub.efiInstallWithBootctl = true;
          #   boot.loader.grub.efiDir = "/boot/efi";
          #   boot.loader.grub.extraEntries = ''
          #     menuentry "Windows" {
          #       insmod part_gpt
          #       insmod fat
          #       insmod search_fs_uuid
          #       insmod chain
          #       search --fs-uuid --no-floppy --set=root 5C0C-3A3A
          #       chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          #     }
          #   '';
          #   boot.loader.systemd-boot.enable = true;
          #   boot.loader.systemd-boot.timeout = 5;
          #   boot.loader.systemd-boot.defaultEntry = "nixos";
          #   boot.loader.systemd-boot.efiSupport = true;
          #   boot.loader.systemd-boot.efiDir = "/boot/efi";
          #   boot.loader.systemd-boot.loader = pkgs.systemd-boot;
          #   boot.loader.systemd-boot.enableCryptodisk = true;
          #   boot.loader.systemd-boot.cryptodisk = "/dev/sda3";
          #   boot.loader.systemd-boot.cryptodiskKeyFile = "/crypto_keyfile.bin";
          #   boot.loader.systemd-boot.cryptodiskUUID = "5c0c3a3a-5c0c-3a3a-5c0c-3a3a5c0c3a3a";
          #   boot.loader.systemd-boot.cryptodiskDevices = [ "/dev/sda3" ];
          #   boot.loader.systemd-boot.cryptodiskMapping = "cryptroot";
          #   boot.loader.systemd-boot.cryptodiskAllowDiscards = true;
          #   boot.loader.systemd-boot.cryptodiskUseLuks2 = true;
          #   boot.loader.systemd-boot.cryptodiskKeyFile = "/crypto_keyfile.bin";
          #   boot.loader.systemd-boot.cryptodiskKeyFileSource = "/crypto_keyfile.bin";
          #   boot.loader.systemd-boot.crypt
        };
      };
    };
}
