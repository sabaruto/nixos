{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.steam.enable = mkEnableOption "steam";

  config = mkIf cfg.steam.enable {
    programs.steam.enable = true;
  };
}
