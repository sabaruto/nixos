{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules;
in
{
  config = mkIf (cfg.desktopEnvironment == "hyprland") {
    hardware = {
      graphics.enable = true;
      nvidia.modesetting.enable = true;
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    environment = {

      systemPackages = with pkgs; [
        eww
        dunst
        waybar
        libnotify

        # network manager applet
        networkmanagerapplet

        # wallpaper daemon
        swww

        # app launcher
        rofi-wayland

        (waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        }))
      ];

      sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
      };
    };
  };
}
