{
  xdg.desktopEntries."@joplinapp-desktop" = {
   # This bastard won't follow theming so I have to set it manually. 
    name = "Joplin";
    exec = "joplin-desktop --no-sandbox %U";
    terminal = false;
    type = "Application";
    icon = "joplin";
    startupwmclass = "Joplin";
    mimetype="x-scheme-handler/joplin;";
    comment = "Joplin for Desktop";
    categories = "Office";
  };
}
