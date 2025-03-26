{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {

  options.localModules.apps.tmux.enable = mkEnableOption "tmux";

  config = mkIf cfg.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";

      # Default
      sensibleOnTop = true;
      shell = "${pkgs.zsh}/bin/zsh";
      mouse = true;

      # prefix key
      prefix = "C-Space";

      plugins = with pkgs.tmuxPlugins; [{
        plugin = catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'latte'";
      }];
      extraConfig = lib.readFile ./tmux.conf;
    };
  };
}
