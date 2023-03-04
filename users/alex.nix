{ inputs, lib, config, pkgs, ... }: {

  users.users = {
    alex = {
      initialPassword = "TheWalrusAndTheCarpenter";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "wheel" "networkmanager" "docker" "mlocate" "libvirtd" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      alex = {
        programs.git = {
        userName = "alex";
        userEmail = "alex@mcculley.tech";
      };
     };
    };
  };
}
