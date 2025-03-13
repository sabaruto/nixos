{ lib, ... }:

with lib;

{
  options.localModules.apps.emacs.enable = mkEnableOption "emacs";
}
