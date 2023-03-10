{ inputs, lib, config, pkgs, ... }: {

  users.users = {
    alex = {
      initialPassword = "ChangeMe!";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "wheel" "networkmanager" "docker" "mlocate" "libvirtd" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
  };
}
