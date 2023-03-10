{
  description = "NixOS workstation config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; 
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, nix-colors, ... }@inputs: {
    nixosConfigurations = {
      
      thinknix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            # Overlays here
          }
          nixos-hardware.nixosModules.lenovo-thinkpad-t450s
          ./hosts/thinknix/configuration.nix 
        ];
      };

      aquinas = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs  = { inherit inputs; }; #pass inputs to home-manager
            # Overlays here
          }
          nixos-hardware.nixosModules.dell-xps-15-9500-nvidia
          ./hosts/aquinas/configuration.nix 
        ];
      };
 
    };
  };
}
