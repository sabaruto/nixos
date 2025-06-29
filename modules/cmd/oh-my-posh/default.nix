{ config, lib, pkgs, ... }:
with lib;
let cfg = config.localModules.cmd.oh-my-posh;
in {

  options.localModules.cmd.oh-my-posh.enable = mkEnableOption "oh-my-posh";

  config = mkIf cfg.enable { home.packages = with pkgs; [ oh-my-posh ]; };
}
