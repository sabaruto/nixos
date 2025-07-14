{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules.apps;
in
{
  options.localModules.apps.kitty.enable = mkEnableOption "kitty";

  config = mkIf cfg.kitty.enable {
    programs.kitty = lib.mkForce {
      enable = true;
      enableGitIntegration = true;

      font = {
        name = "Lilex";
        package = pkgs.nerd-fonts.lilex;
        size = 14;
      };

      shellIntegration = {
        enableZshIntegration = true;
      };

      settings = {
        confirm_os_window_close = 0;

        tab_bar_style = "fade";
        wayland_titlebar_color = "system";

        background_opacity = "0.25";
        background_blur = 0;
        dynamic_background_opacity = false;
        font_size = 14;

        cursor_trail = 3;
      };
    };
  };
}
