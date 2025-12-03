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
  options.localModules.apps.kitty.enable = mkEnableOption "kitty";

  config = mkIf cfg.kitty.enable {
    localModules.lib.home-files = [
      {
        name = "kitty";
        recursive = true;
        source = "${config.localModules.const.dotfiles}/kitty";
        target = ".config/kitty";
      }
    ];

    home.packages = with pkgs; [
      kitty
    ];
  };
}
