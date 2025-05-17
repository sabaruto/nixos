{ lib, config, ... }:

with lib;
let
  cfg = config.localModules.dotfiles;
  user = config.localModules.name;
  homeDirectory = "${config.users.users.${user}.home}";
  path = "${homeDirectory}/nixos/modules/nixos/default/dotfiles";
in {
  options.localModules.dotfiles = {
    hyprland = {
      enable = mkEnableOption "hyprland";
      monitors = mkOption {
        type = with types; nullOr (enum [ "default" "alienware" "zalu" ]);
      };
    };
    waybar = { enable = mkEnableOption "waybar"; };

    kde.enable = mkEnableOption "kde";
  };

  config = {
    localModules.lib.links = mkMerge [
      (mkIf cfg.hyprland.enable [
        {
          sourcePath = "${path}/dotconfig/hypr";
          symbolicLink = "${homeDirectory}/.config";
        }
        {
          sourcePath =
            "${path}/option-files/${cfg.hyprland.monitors}.monitors.conf";
          symbolicLink = "${homeDirectory}/.config/hypr/monitors.conf";
        }
      ])

      (mkIf cfg.waybar.enable [{
        sourcePath = "${path}/dotconfig/waybar";
        symbolicLink = "${homeDirectory}/.config";
      }])

      (mkIf cfg.kde.enable [
        {
          sourcePath =
            "${path}/dotconfig/plasma-org.kde.plasma.desktop-appletsrc";
          symbolicLink =
            "${homeDirectory}/.config/plasma-org.kde.plasma.desktop-appletsrc";
        }
        {
          sourcePath = "${path}/dotconfig/plasmashellrc";
          symbolicLink = "${homeDirectory}/.config/plasmashellrc";
        }
      ])
    ];
  };
}
