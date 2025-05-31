{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.localModules.apps;
  path =
    "${config.home.homeDirectory}/nixos/modules/home-manager/default/apps/alacritty";
in {
  options.localModules.apps.alacritty.enable = mkEnableOption "Alacritty";

  config = mkIf cfg.alacritty.enable {
    home.packages = with pkgs; [ alacritty ];

    xdg.configFile."alacritty".source =
      config.lib.file.mkOutOfStoreSymlink "${path}/alacritty";
  };
}
