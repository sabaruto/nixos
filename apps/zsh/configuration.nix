{ lib, config, home, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.zsh.enable { };
}
