{pkgs, ...}: {
	programs.vim = {
      enable = true;
       plugins = with pkgs.vimPlugins; [ 
       nerdtree
       YouCompleteMe
       ];
      extraConfig = builtins.readFile ./vimrc;
	};
}