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

    localModules.lib.links = [{
      sourcePath = "${path}/alacritty";
      symbolicLink = "${config.home.homeDirectory}/.config";
    }];
  };
}
