# These are values that every setup will need

{inputs, config, pkgs, lib, ...}: {

  imports = [
   ./ssh
  ];

  nix = {
	settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
	};

	gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 32d";
	};
  };

  nixpkgs.config.allowUnfree = true;

  users.defaultUserShell = pkgs.zsh;

  services.xserver.excludePackages = [ pkgs.xterm ];
  
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  environment.variables = {
    EDITOR = "vim";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    vim
    firefox
    wget
    git
    zsh
    fira-code
    tree
    parted
    tmux
    virt-manager
  ];

}
