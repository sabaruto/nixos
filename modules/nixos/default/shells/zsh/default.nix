{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.localModules.shells;
  homeDirectory = "/home/t-aaronobelley";
  path = "${homeDirectory}/nixos/modules/nixos/default/shells/zsh";
in {
  options.localModules.shells.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [ "git" "dotenv" "direnv" ];

        theme = "robbyrussell";
      };

      shellInit = ''
        source ~/.aliases
        eval "$(direnv hook zsh)"
        eval "$(oh-my-posh init zsh --config ~/.config/theme.omp.json)"
      '';
    };

    localModules.lib.links = [{
      sourcePath = "${path}/.zshrc";
      symbolicLink = "${homeDirectory}/.zshrc";
    }];
  };
}
