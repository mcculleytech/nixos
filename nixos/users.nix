{ inputs, lib, config, pkgs, ... }: {

  users.users = {
    alex = {
      # Change it after boot!
      initialPassword = "TheWalrusAndTheCarpenter";
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "wheel" "networkmanager" "docker" ];
    };
  };

  # home manager config, will rebuild with nixos
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      # Import your home-manager configuration
      alex = import ../home-manager/home.nix;
    };
  };
}
