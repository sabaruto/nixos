{ config, pkgs, ... }:
{
  imports = [
    ../nvidia.nix
  ];

  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = with pkgs; [
    # required for the default Hyprland config
    kitty 

    # nvidia configuration
    egl-wayland
  ];

  # Nvidia 
  boot.initrd.availableKernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia_drm modeset=1 fbdev=1
  '';

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}