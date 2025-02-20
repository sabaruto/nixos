{ config, home, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git"
        "dotenv"
        "1password"
      ];
      
      theme = "robbyrussell";
    };
  };
}
