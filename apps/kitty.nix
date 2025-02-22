{ lib, config, pkgs, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;

      tab_bar_style = "fade";
      wayland_titlebar_color = "system";

      dynamic_background_opacity = true;
      background_opacity = "0.25";
      background_blur = 5;
    };
  };
}