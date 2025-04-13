{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.neovim;
in
{
  options.localModules.apps.neovim.enable = mkEnableOption "neovim";

  config.programs.neovim = mkIf cfg.enable {
    enable = true;
  };
}
