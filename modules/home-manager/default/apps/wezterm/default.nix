{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.localModules.apps.wezterm;
  path =
    "${config.home.homeDirectory}/nixos/modules/home-manager/default/apps/wezterm";
in {
  options.localModules.apps.wezterm.enable = mkEnableOption "Wezterm";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ wezterm ];

    localModules.lib.links = [{
      sourcePath = "${path}/.wezterm.lua";
      symbolicLink = "${config.home.homeDirectory}/.wezterm.lua";
    }];
  };
}
