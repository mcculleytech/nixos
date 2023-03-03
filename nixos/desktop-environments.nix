{ inputs, lib, config, pkgs, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Pantheon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.pantheon.enable = true;

  # Remove default packages
  services.pantheon.apps.enable = false;
  
  # Add tweaks
  programs.pantheon-tweaks.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
