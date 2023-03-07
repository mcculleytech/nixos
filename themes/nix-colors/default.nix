{ pkgs, config, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModule
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  programs = {
    terminator = {
      enable = true;  
        settings = {
          foreground = "#${config.colorScheme.colors.base05}";
          background = "#${config.colorScheme.colors.base00}";
        };
    };
  };
}