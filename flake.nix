{
  description = "My NixOS Configuration";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.reassOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware-configuration.nix
        ./audioAndPrinting.nix
	./automatic.nix
	./localeAndNetworking.nix
	./users.nix
	./bootloaderAndDesktopEnvironment.nix
	./nvidia.nix
	./hyprland.nix
        ./configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
