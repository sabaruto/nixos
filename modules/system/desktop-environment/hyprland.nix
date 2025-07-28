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
      withUWSM = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };

    environment = {

      systemPackages = with pkgs; [
        # widget enginr
        eww

        dunst
        waybar
        pavucontrol
        blueman
        libnotify

        # Clipboard manager
        wl-clipboard

        #lock screen
        hyprlock
        hypridle

        # network manager applet
        networkmanagerapplet

        # wallpaper daemon
        swww

        # audio
        pulseaudio
        pamixer

        # brightness
        brightnessctl

        # app launcher
        rofi-wayland

        # cursor themes
        rose-pine-hyprcursor

        # GTK settings editor
        nwg-look

        # Bluetooth GUI
        blueberry

        # File manager
        nautilus

        # Remote desktop
        wayvnc

        # Protocols
        wlr-protocols
        frog-protocols

        # Media Player
        mpv
        gthumb

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
