{
  inputs,
  lib,
  config,
  ...
}:

with lib;
{
  imports = [
    ./zen/home.nix
  ];

  options.localModules.browsers.enable = mkEnableOption "built browsers";

  config = mkIf config.localModules.browsers.enable {
    localModules.apps.zen.enable = true;
  };
}
