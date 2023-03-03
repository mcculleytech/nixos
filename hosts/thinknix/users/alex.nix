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
    ../../../modules/gtk
    ../../../modules/git
    ../../../modules/ssh
    ];

    home.stateVersion = "21.11";
  };
}
