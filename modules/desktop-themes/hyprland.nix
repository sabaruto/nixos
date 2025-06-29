{ lib, config, pkgs, ... }:
with lib; {
  config = mkIf (config.localModules.desktopEnvironment == "hyprland") {
    gtk = {
      enable = true;

      cursorTheme = {
        package = pkgs.vimix-cursors;
        name = "Vimix-cursors";
      };

      theme = {
        package = pkgs.rose-pine-gtk-theme;
        name = "rose-pine";
      };

      iconTheme = {
        package = pkgs.rose-pine-icon-theme;
        name = "rose-pine";
      };
    };
  };
}
