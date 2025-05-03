{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.cronjobs.theme-switching;

in
{
  options.localModules.cronjobs.theme-switching = {
    enable = mkEnableOption "Theme Switching";
  };

  config =
    let
      theme-switcher = import ./scripts/theme-switcher.nix {
        inherit pkgs;
        conf-path = ./nwg-look-conf;
        user = home.username;
      };
    in
    mkIf cfg.enable {
      home.packages = [
        theme-switcher
      ];

      systemd.user = {
        timers = {
          "light-mode" = {
            "Timer" = {
              Unit = "light-mode.service";
              OnCalendar = "*-*-* 6:00:00 Europe/London";
              Persistent = true;
            };
            "Install" = {
              WantedBy = [ "timers.target" ];
            };
          };

          "dark-mode" = {
            "Timer" = {
              Unit = "dark-mode.service";
              OnCalendar = "*-*-* 19:00:00 Europe/London";
              Persistent = true;
            };
            "Install" = {
              WantedBy = [ "timers.target" ];
            };
          };
        };

        services = {
          "light-mode" = {
            Service.ExecStart = "${theme-switcher}/bin/switch-theme light";
          };

          "dark-mode" = {
            Service.ExecStart = "${theme-switcher}/bin/switch-theme dark";
          };
        };
      };
    };
}
