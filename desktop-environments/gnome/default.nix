{ inputs, lib, config, pkgs, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.libinput.enable = true;

  # Enable the Pantheon Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.pantheon.enable = true;
  # services.pantheon.apps.enable = false;
  # programs.pantheon-tweaks.enable = true;
  
  # Gnome Desktop
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;
  # Exclude gnome software
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]);

  # Online Accounts
  services.accounts-daemon.enable = true;
  services.gnome.gnome-online-accounts.enable = true;

  # Gnome Tweaks
  environment.systemPackages= (with pkgs; [
    gnome.gnome-tweaks
    gnome.nautilus
    gnome.gnome-calendar
    gnome.gnome-control-center
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
  ]);

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
