{ lib, config, pkgs, ... }:

with lib;
with lib.gvariant;
let cfg = config.localModules;
in {
  config = mkIf (cfg.desktopEnvironment == "gnome") {

    qt = {
      enable = true;
      platformTheme = "gnome";
    };

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
