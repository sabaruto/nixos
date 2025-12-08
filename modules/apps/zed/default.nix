{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.zed;
in
{
  options.localModules.apps.zed.enable = mkEnableOption "Zed";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ zed-editor ];

    localModules.lib.home-files = [
      {
        name = "zed-editor";
        recursive = true;
        source = "${config.localModules.const.dotfiles}/zed";
        target = ".config/zed";
      }
    ];
  };
}
