{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules;
in
{
  config = mkIf (cfg.desktopEnvironment == "kde") {
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs.kdePackages; [
      wayqt
      kwayland
      layer-shell-qt
    ];

    qt = {
      enable = true;
      style = "breeze";
      platformTheme = "kde6";
    };

    services = {
      xserver.enable = true;

      desktopManager = {
        plasma6.enable = true;
      };

      displayManager = {
        defaultSession = "plasma";

        sddm = {
          enable = true;
          wayland.enable = true;

          extraPackages = [

          ];
        };
      };
    };
  };
}
