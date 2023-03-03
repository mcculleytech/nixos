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
  # Exclude gnome software
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-contacts
    gnome-initial-setup
    gnome-weather
    gnome-text-editor
    gnome-document-scanner
    gnome-maps
    gnome-help
    gnome-clocks
    gnome-font-viewer
    gnome-shell
    gnome-browser-connector
    gnome-browser-connector-host
    gnome-system-monitor
  ]);

  # Gnome Tweaks
  environment.systemPackages = [
    pkgs.gnome.gnome-tweaks
  ];

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
