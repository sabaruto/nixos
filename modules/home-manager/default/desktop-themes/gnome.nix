{ lib, config, pkgs, ... }:
with lib; {
  config = mkIf (config.localModules.desktopEnvironment == "gnome") {
    gtk = with pkgs; {
      enable = true;

      iconTheme = {
        name = "rose-pine";
        package = rose-pine-icon-theme;
      };

      theme = {
        name = "rose-pine";
        package = rose-pine-gtk-theme;
      };

      cursorTheme = {
        name = "BreezeX-RosePine-Linux";
        package = rose-pine-cursor;
      };
    };

    dconf.settings = {
      "org.gnome/shell" = { disable-user-extensions = false; };

      "org/gnome/desktop/notifications" = { accent-color = "yellow"; };

      "org/gnome/desktop/peripherals/touchpad" = {
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/shell/extensions/nightthemeswitcher/time" = {
        manual-schedule = true;
      };

      "org/gnome/desktop/interface" = {
        accent-color = "yellow";
        cursor-size = lib.hm.gvariant.mkUint32 24;
        font-name = "Source Sans 3,  12";
      };

      "org/gnome/shell/extensions/tilingshell" = {
        inner-gaps = lib.hm.gvariant.mkUint32 0;
        outer-gaps = lib.hm.gvariant.mkUint32 0;
      };
    };

    home.packages = with pkgs.gnomeExtensions; [
      tiling-shell
      coverflow-alt-tab
      blur-my-shell
      sound-output-device-chooser
      night-theme-switcher

      pkgs.gnome-tweaks
      pkgs.source-sans
    ];
  };
}
