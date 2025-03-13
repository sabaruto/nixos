{ lib, inputs, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.emacs.enable = mkEnableOption "emacs";

  config = mkIf cfg.emacs.enable { nixpkgs.overlays = [ (import inputs.emacs-overlay) ]; };
}
