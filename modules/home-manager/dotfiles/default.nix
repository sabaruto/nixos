{
  lib,
  config,
  ...
}:

with lib;
let
  cfg = config.localModules.dotfiles;
  path = "${config.home.homeDirectory}/nixos/modules/home-manager/dotfiles";
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

  config = {
    localModules.lib.links = mkMerge [
      (mkIf cfg.hyprland.enable [
        {
          sourcePath = "${path}/dotconfig/hypr";
          symbolicLink = "${config.home.homeDirectory}/.config";
        }
        {
          sourcePath = "${path}/option-files/${cfg.hyprland.monitors}.monitors.conf";
          symbolicLink = "${config.home.homeDirectory}/.config/hypr/monitors.conf";
        }
      ])

      (mkIf cfg.waybar.enable [
        {
          sourcePath = "${path}/dotconfig/waybar";
          symbolicLink = "${config.home.homeDirectory}/.config";
        }
      ])
    ];
  };
}
