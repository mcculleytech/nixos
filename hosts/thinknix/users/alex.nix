{ lib, ... }:

{
  imports = [
    ../../../users/alex.nix
  ];

  home-manager.users.alex = {
    imports = [
    ../../../modules/joplin-desktop
    ../../../modules/home.nix
    ../../../modules/zsh
    ../../../modules/terminator
    ../../../modules/tmux
    ../../../modules/git
    ../../../themes/gtk
    ];

    home.stateVersion = "21.11";
  };
}
