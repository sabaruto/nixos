{ config, pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    tiling-shell
    coverflow-alt-tab
    blur-my-shell
    sound-output-device-chooser
    night-theme-switcher
  ] ++ (with pkgs; [
    gnome-tweaks
  ]);
}
