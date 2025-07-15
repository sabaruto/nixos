{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.wezterm;
in
{
  options.localModules.apps.wezterm.enable = mkEnableOption "Wezterm";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ wezterm ];

    localModules.lib.home-files = [
      {
        name = "wezterm.lua";
        recursive = true;
        source = "${config.localModules.const.dotfiles}/dot_wezterm.lua";
        target = ".wezterm.lua";
      }
    ];
  };
}
