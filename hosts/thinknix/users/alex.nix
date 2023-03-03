{ lib, ... }:

{
  imports = [
    ../../../users/alex.nix
  ];

  home-manager.users.alex = {
    imports = [
    ../../../modules/home.nix
    ../../../modules/zsh
    ../../../modules/terminator
    ../../../themes/gtk
    ../../../modules/git
    ];

    home.stateVersion = "21.11";
  };
}
