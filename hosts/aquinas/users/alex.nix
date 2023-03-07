{ lib, ... }:

{
  imports = [
    ../../../users/alex.nix
  ];

  home-manager.users.alex = {
    imports = [
    ../../../modules/joplin-desktop
    ../../../modules/home.nix
    ../../../modules/vim
    ../../../modules/zsh
    #../../../modules/terminator
    ../../../modules/tmux
    ../../../modules/git
    ../../../themes/gtk
    ../../../themes/nix-colors
    ];

    home.stateVersion = "22.11";
  };
}
