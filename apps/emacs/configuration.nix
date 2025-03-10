{ lib, inputs, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.emacs.enable = mkEnableOption "emacs";

  config = mkIf cfg.emacs.enable {
    services.emacs.package = pkgs.emacs-git;

    nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

    environment.systemPackages = [
      (pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs-git;
        config = ./init.el;

        extraEmacsPackages = epkgs: [ epkgs.use-package ];

        defaultInitFile = true;

        alwaysEnsure = true;
      })
    ];
  };
}
