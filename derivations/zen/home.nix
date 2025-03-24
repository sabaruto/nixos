{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules.apps;
in
{
  options.localModules.apps.zen.enable = mkEnableOption "zen";

  config = mkIf cfg.zen.enable {
    home.packages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}
