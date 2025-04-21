{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.localModules.dotfiles;
in
{
  options.localModules.dotfiles = {
    hyprland = {
      enable = mkEnableOption "hyprland";
      monitors = mkOption {
        type =
          with types;
          nullOr (enum [
            "default"
            "alienware"
            "zalu"
          ]);
      };
    };
    waybar = {
      enable = mkEnableOption "waybar";
    };
  };

  config.home.file = {
    ".config/hypr" = mkIf cfg.hyprland.enable {
      source = ./dotconfig/hypr;
      recursive = true;
    };

    ".config/hypr/monitors.conf" = mkIf (cfg.hyprland.enable) (mkMerge [
      (mkIf (cfg.hyprland.monitors == "default") {
        text = "monitor=,preferred,auto,auto";
      })
      (mkIf (cfg.hyprland.monitors == "alienware") {
        text = "monitor=,3840x2160@239.99Hz,auto,auto";
      })
      (mkIf (cfg.hyprland.monitors == "zalu") {
        text = "monitor=,preferred,auto,auto";
      })
    ]);

    ".config/waybar" = mkIf cfg.waybar.enable {
      source = ./dotconfig/waybar;
      recursive = true;
    };
  };
}
