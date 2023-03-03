{
  description = "NixOS workstation flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
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
          ./hosts/thinknix/configuration.nix 
        ];
      }; 
    };
  };
}
