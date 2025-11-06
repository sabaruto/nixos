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
      # wayqt
      kwayland
      layer-shell-qt
      plasma-browser-integration
      partitionmanager
      konqueror
      wacomtablet
    ];

    qt = {
      enable = true;
      style = "breeze";
      platformTheme = "kde";
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
        };
      };
    };
  };
}
