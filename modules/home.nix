# home-manager configuration file

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
  ];

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  home.packages = with pkgs; [ 
   bitwarden
   spotify
   sublime4 
   terminator
   flameshot
   guake
   element-desktop
   joplin-desktop # module for theming is set in hosts module
   jellyfin-media-player
   tootle
   remmina
   neofetch
  ];

  # Enable home-manager
  programs.home-manager.enable = true;


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";  
}
