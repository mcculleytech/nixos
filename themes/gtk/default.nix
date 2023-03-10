{pkgs,...}:
let
  theme = "Nordic-darker-standard-buttons";
in

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    theme = {
       name = "${theme}";
       package = pkgs.nordic;
    };

    gtk3.extraConfig = {
        gtk-application-prefer-dark-theme=1;
    };

    gtk4.extraConfig = {
        gtk-application-prefer-dark-theme=1;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell" = {
      favorite-apps = [
       "firefox.desktop"
       "org.gnome.Nautilus.desktop"
       "virt-manager.desktop"
       "bitwarden.desktop"
       "terminator.desktop"
       "spotify.desktop"
       "signal-desktop.desktop"
       "sublime_text.desktop"
       "@joplinapp-desktop.desktop"
       "org.remmina.Remmina.desktop"
       ];
      disable-user-extentions = false;
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-dock@micxgx.gmail.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ]; 
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "${theme}";
    };
  };
  home.sessionVariables.GTK_THEME = "${theme}";
}
