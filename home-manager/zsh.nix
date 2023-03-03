# zsh config
{ inputs, lib, config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
         "git"
         "sudo"
      ];
      theme = "bira";
    };
    shellAliases = {
      ga           = "git add .";
      gcm          = "git commit -m";
      gs           = "git status";
      nix-rebuild  = "sudo nixos-rebuild switch";
      gpom	   = "git push -u origin master";
    };
  };
}
