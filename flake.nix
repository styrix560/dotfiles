{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          ({pkgs, ...}: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.work= import ./home/home.nix;
            home-manager.backupFileExtension = "backup";

            users.users.work = {
              isNormalUser = true;
              extraGroups = [ "networkmanager" "wheel" ];
              shell = pkgs.zsh;
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          })
        ];
      };
    };
  };
}
