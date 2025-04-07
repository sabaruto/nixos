{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.tmux-navigator.enable = mkEnableOption "tmux-navigator";

  config.programs.nixvim.plugins.tmux-navigator = mkIf cfg.tmux-navigator.enable {
    enable = true;
    settings.no_mappings = 1;

    keymaps = [
      {
        action = "left";
        key = "<M-Left>";
      }
      {
        action = "right";
        key = "<M-Right>";
      }
      {
        action = "up";
        key = "<M-Up>";
      }
      {
        action = "down";
        key = "<M-Down>";
      }
      {
        action = "previous";
        key = "<M-\\>";
      }
    ];
  };
}
