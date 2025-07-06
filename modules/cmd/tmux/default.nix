{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules.apps;
in
{

  options.localModules.apps.tmux.enable = mkEnableOption "tmux";

  config = mkIf cfg.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";

      # Default
      sensibleOnTop = true;
      mouse = true;

      # prefix key
      prefix = "C-Space";

      plugins = with pkgs.tmuxPlugins; [
        yank
        {
          plugin = catppuccin;
          extraConfig = "set -g @catppuccin_flavour 'latte'";
        }
        {
          plugin = vim-tmux-navigator;
          extraConfig = ''
            set -g @vim_navigator_mapping_left "C-Left C-H"  # use C-h and C-Left
            set -g @vim_navigator_mapping_right "C-Right C-L"
            set -g @vim_navigator_mapping_up "C-Up C-K"
            set -g @vim_navigator_mapping_down "C-Down C-J"
            set -g @vim_navigator_mapping_prev ""  # removes the C-\ binding
          '';

        }
      ];
      extraConfig = lib.readFile ./tmux.conf;
    };
  };
}
