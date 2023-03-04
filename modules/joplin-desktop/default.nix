{
  xdg.desktopEntries = {
    "@joplinapp-desktop" = {
     # This bastard won't follow theming so I have to set it manually. 
      name = "Joplin";
      exec = "joplin-desktop --no-sandbox %U";
      terminal = false;
      type = "Application";
      icon = "joplin";
      comment = "Joplin for Desktop";
      categories = [ "Office" ];
      settings = {
        StartupWMClass = "joplin";
      };
    };
  };
}
