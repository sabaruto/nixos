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
  options.localModules.apps.helix.enable = mkEnableOption "helix";

  config = mkIf cfg.helix.enable {
    home.packages = with pkgs; [
      helix
      taplo
    ];
  };
}
