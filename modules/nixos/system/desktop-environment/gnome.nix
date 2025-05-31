{ lib, config, pkgs, ... }:

with lib;
with lib.gvariant;
let cfg = config.localModules;
in {
  config = mkIf (cfg.desktopEnvironment == "gnome") {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
