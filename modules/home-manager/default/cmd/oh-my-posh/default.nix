{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.localModules.cmd.oh-my-posh;
  path =
    "${config.home.homeDirectory}/nixos/modules/home-manager/default/cmd/oh-my-posh";
in {

  options.localModules.cmd.oh-my-posh.enable = mkEnableOption "oh-my-posh";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ oh-my-posh ];

    localModules.lib = {
      links = [{
        sourcePath = "${path}/theme.omp.json";
        symbolicLink = "${config.home.homeDirectory}/.config/theme.omp.json";
      }];
    };
  };
}
