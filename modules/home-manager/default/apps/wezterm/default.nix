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
    home.file.".wezterm.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${path}/.wezterm.lua";
  };
}
