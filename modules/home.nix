# home-manager configuration file

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here

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
   joplin
   guake
  ];

  # Enable home-manager
  programs.home-manager.enable = true;


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";  
}
