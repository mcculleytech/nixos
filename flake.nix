{
  description = "NixOS workstation config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; 
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      
      thinknix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Overlays here
          }
          nixos-hardware.nixosModules.lenovo-thinkpad-t450s
          ./hosts/thinknix/configuration.nix 
        ];
      };
 
    };
  };
}
