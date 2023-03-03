# home-manager configuration file

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./zsh
    ./terminator
    ./gtk
    ./git
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
