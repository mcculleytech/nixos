{
  programs.terminator = { 
    enable = true;
    config = {
      global_config = { 
        title_inactive_bg_color = "#4C566A";
        title_inactive_fg_color = "#D8DEE9";
        title_receive_bg_color = "#8FBCBB";
        title_receive_fg_color = "#2E3440";
        title_transmit_bg_color = "#88C0D0";
        title_transmit_fg_color = "#2E3440";
      };
      
      # set nord as default
      profiles.default = {
        background_color = "#2E3440";
        cursor_color = "#D8DEE9";
        foreground_color = "#D8DEE9";
        palette =    "#3B4252:#BF616A:#A3BE8C:#EBCB8B:#81A1C1:#B48EAD:#88C0D0:#E5E9F0:#4C566A:#BF616A:#A3BE8C:#EBCB8B:#81A1C1:#B48EAD:#8FBCBB:#ECEFF4";
        use_system_font = false;
        show_titlebar = false;
        font = "Fira Code Regular 18";
      };

      # melange
      profiles.melange = {
        background_color = "#292522";
        cursor_color = "#ECE1D7";
        foreground_color = "#ECE1D7";
        palette = "#34302C:#BD8183:#78997A:#E49B5D:#7F91B2:#B380B0:#7B9695:#C1A78E:#867462:#D47766:#85B695:#EBC06D:#A3A9CE:#CF9BC2:#89B3B6:#ECE1D7";
        use_system_font = false;
        show_titlebar = false;
        font = "Fira Code Regular 18";
      };
    };
  };
}
