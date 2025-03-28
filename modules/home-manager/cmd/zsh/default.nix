{ lib, config, ... }:

with lib;

let
  cfg = config.localModules.apps;
in
{
  options.localModules.apps.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.zsh.enable {
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

      envExtra = "source ~/.aliases";
    };
  };
}
